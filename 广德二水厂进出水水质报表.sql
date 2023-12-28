USE GuangDe
GO
/****** Object:  StoredProcedure [dbo].[proc_��ˮ��ˮ�ʱ������]    Script Date: 2023/12/25 9:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure proc_��¶�ˮ������ˮˮ�ʱ���
as
declare @counter int=(select count(Datetimes) from ��¶�ˮ������ˮˮ�ʱ���)--jc˲ʱ����������
declare @maxtime datetime=(select max(Datetimes) from ��¶�ˮ������ˮˮ�ʱ���)--jc˲ʱ�����������ʱ��
declare @temp table(
id int primary key not null,
Datetimes Datetime not null,
ԭˮ�Ƕ� float,
ԭˮPH float,
����ˮ�Ƕ� float,
����ˮPH float,
����ˮ���� float,
����ˮCOD float,
����ˮ���� float,
����ˮ���� float,
��ˮ��һ��Һλ float,
��ˮ�ض���Һλ float
)
insert into @temp
select
ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as �к�,
h1.DateTime as ʱ��,
max(case h1.TagName when 'PLC31_NTU1001_VAL' then Round(h1.Value,2) else 0 end) �ָ�դ������Һλ,
max(case h1.TagName when 'PLC31_pH1001_VAL'  then Round(h1.Value,2) else 0 end) һ��ϸ��դ��ɳ��Һλ,
max(case h1.TagName when 'PLC1_NTU1001_VAL'  then Round(h1.Value,2) else 0 end) ����ϸ��դ��ɳ��Һλ,
max(case h1.TagName when 'PLC1_PH1001_VAL'   then Round(h1.Value,0) else 0 end) һ����ˮ����ˮ����,
max(case h1.TagName when 'PLC1_NH1001_VAL'   then Round(h1.Value,0) else 0 end) ������ˮ����ˮ����,
max(case h1.TagName when 'PLC1_COD1001_VAL'  then Round(h1.Value,0) else 0 end) ������ˮ����ˮ����,
max(case h1.TagName when 'PLC1_CL1001_VAL'   then Round(h1.Value,0) else 0 end) �ĺ���ˮ����ˮ����
max(case h1.TagName when 'PLC4_FT2001_VAL'   then Round(h1.Value,0) else 0 end) һ����ˮ����ˮ����,
max(case h1.TagName when 'PLC4_FT2001_Total' then Round(h1.Value,0) else 0 end) ������ˮ����ˮ����,
max(case h1.TagName when 'PLC2_LT5001_VAL'   then Round(h1.Value,0) else 0 end) ������ˮ����ˮ����,
max(case h1.TagName when 'PLC2_LT5002_VAL'   then Round(h1.Value,0) else 0 end) �ĺ���ˮ����ˮ����
from Runtime.dbo.History h1
where h1.TagName in (
'PLC31_NTU1001_VAL'
'PLC31_pH1001_VAL' 
'PLC1_NTU1001_VAL' 
'PLC1_PH1001_VAL'  
'PLC1_NH1001_VAL'  
'PLC1_COD1001_VAL' 
'PLC1_CL1001_VAL'  
'PLC4_FT2001_VAL'  
'PLC4_FT2001_Total'
'PLC2_LT5001_VAL'  
'PLC2_LT5002_VAL'  
)
AND h1.wwRetrievalMode='Average'
and h1.DateTime >='2023-11-29' AND h1.DateTime <= getdate()
and h1.wwResolution=3600000
group by h1.DateTime
--declare @flag bit=1 --���ڿ���ɾ��
if @counter<=0
begin
insert into ��¶�ˮ������ˮˮ�ʱ���
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
		--	delete from wscˮ�ʱ��� where Datetimes=@maxtime
		--end
		--set @flag=0
		set @maxtime=(select max(Datetimes) from ��¶�ˮ������ˮˮ�ʱ���)
		--declare @temp int=1
		while @maxtime<getdate() 
		and
		(DATEPART(year,@maxtime)!=DATEPART(year,getdate()) 
		or DATEPART(month,@maxtime)!=DATEPART(month,getdate()) 
		or DATEPART(day,@maxtime)!=DATEPART(day,getdate())  
		or DATEPART(HH,@maxtime)!=DATEPART(hh,getdate()))
		begin
			insert into ��¶�ˮ������ˮˮ�ʱ���
			select
			* from @temp where Datetimes=DateAdd(HH,1,@maxtime)
			--set @temp=@temp+1
			set @maxtime=DateAdd(HH,1,@maxtime)
		end
		--set @flag=1
		end
		end
	end
