USE GuangDe
GO
/****** Object:  StoredProcedure [dbo].[proc_污水厂水质报表插入]    Script Date: 2023/12/25 9:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure proc_广德二水厂加药加氯间报表
as
declare @counter int=(select count(Datetimes) from 广德二水厂加药加氯间报表)--jc瞬时流量表行数
declare @maxtime datetime=(select max(Datetimes) from 广德二水厂加药加氯间报表)--jc瞬时流量表中最大时间
declare @temp table(
id int primary key not null,
Datetimes Datetime not null,
一号溶液罐液位  float,
二号溶液罐液位  float,
一号PAC投加流量 float,
二号PAC投加流量 float,
一号储氯罐液位  float,
二号储氯罐液位  float,
前加氯投加流量  float,
后加氯投加流量  float
)
insert into @temp
select
ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as 行号,
h1.DateTime as 时间,
max(case h1.TagName when 'PLC1_LT1001_VAL' then Round(h1.Value,2) else 0 end) 一号溶液罐液位 ,
max(case h1.TagName when 'PLC1_LT1002_VAL'  then Round(h1.Value,2) else 0 end) 二号溶液罐液位 ,
max(case h1.TagName when 'PLC1_FT1001_VAL'  then Round(h1.Value,0) else 0 end) 一号PAC投加流量,
max(case h1.TagName when 'PLC1_FT1002_VAL'   then Round(h1.Value,0) else 0 end) 二号PAC投加流量,
max(case h1.TagName when 'PLC1_LT2001_VAL'   then Round(h1.Value,2) else 0 end) 一号储氯罐液位 ,
max(case h1.TagName when 'PLC1_LT2002_VAL'  then Round(h1.Value,2) else 0 end) 二号储氯罐液位 ,
max(case h1.TagName when 'PLC1_FT2001_VAL'   then Round(h1.Value,0) else 0 end) 前加氯投加流量 ,
max(case h1.TagName when 'PLC1_FT2002_VAL'   then Round(h1.Value,0) else 0 end) 后加氯投加流量 
from Runtime.dbo.History h1
where h1.TagName in (
'PLC1_LT1001_VAL',
'PLC1_LT1002_VAL',
'PLC1_FT1001_VAL',
'PLC1_FT1002_VAL',
'PLC1_LT2001_VAL',
'PLC1_LT2002_VAL',
'PLC1_FT2001_VAL',
'PLC1_FT2002_VAL'
)
AND h1.wwRetrievalMode='Average'
and h1.DateTime >='2023-11-29' AND h1.DateTime <= getdate()
and h1.wwResolution=3600000
group by h1.DateTime
--declare @flag bit=1 --用于控制删除
if @counter<=0
begin
insert into 广德二水厂加药加氯间报表
select
*
from @temp
end
else
begin
	if (datepart(hour,GETDATE())>DATEPART(hour,@maxtime) 
	and datepart(year,GETDATE())=DATEPART(year,@maxtime) 
	and datepart(month,GETDATE())=DATEPART(month,@maxtime) 
	and datepart(DAY,GETDATE())=DATEPART(DAY,@maxtime)) 
	or (datepart(year,GETDATE())>DATEPART(year,@maxtime) 
	or datepart(month,GETDATE())>DATEPART(month,@maxtime) 
	or datepart(DAY,GETDATE())>DATEPART(DAY,@maxtime))
	begin
	if datepart(MINUTE,GETDATE())>=1
	begin
		--if @flag =1
		--begin
		--	delete from wsc水质报表 where Datetimes=@maxtime
		--end
		--set @flag=0
		set @maxtime=(select max(Datetimes) from 广德二水厂加药加氯间报表)
		--declare @temp int=1
		while @maxtime<getdate() 
		and
		(DATEPART(year,@maxtime)!=DATEPART(year,getdate()) 
		or DATEPART(month,@maxtime)!=DATEPART(month,getdate()) 
		or DATEPART(day,@maxtime)!=DATEPART(day,getdate())  
		or DATEPART(HH,@maxtime)!=DATEPART(hh,getdate()))
		begin
			insert into 广德二水厂加药加氯间报表
			select
			* from @temp where Datetimes=DateAdd(HH,1,@maxtime)
			--set @temp=@temp+1
			set @maxtime=DateAdd(HH,1,@maxtime)
		end
		--set @flag=1
		end
		end
	end
