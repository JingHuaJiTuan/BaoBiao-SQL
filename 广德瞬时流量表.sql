USE GuangDe
GO
/****** Object:  StoredProcedure [dbo].[proc_污水厂水质瞬时报表插入]    Script Date: 2023/12/25 14:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[proc_广德二水厂瞬时流量表]
as
declare @counter int =(select COUNT(id) from 广德二水厂瞬时流量表)
--declare @currentvalue float = (select max(case h1.TagName when 'PLC21_FT1015_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC21_FT1015_Total') AND  h1.wwResolution=3600000)
--当表为空时--
if @counter<=0
begin
	declare @counterDay int =(select COUNT(id) from 广德二水厂累计流量表)
	--declare @currentSumValue float=(select max(case h1.TagName when 'PLC1_FT1001_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC1_FT1001_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumValueOne float=(select max(case h1.TagName when 'PLC4_FT1001_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC4_FT1001_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumValueTwo float=(select max(case h1.TagName when 'PLC4_FT1002_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC4_FT1002_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumValueAddMedicine float=(select max(case h1.TagName when 'PLC5_FT1001_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC5_FT1001_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumChuChang float =(select max(case h1.TagName	when     'PLC4_FT2001_Total'  then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC4_FT2001_Total' ) AND  h1.wwResolution=3600000)
	--declare @currentSumFanChongXi float =(select max(case h1.TagName	when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC4_FT1001_Total' ) AND  h1.wwResolution=3600000)
	--declare @currentSumJinShuiOne float=(select max(case h1.TagName   when   'PLC31_FT1001_Total' then Round(h1.Value,0) else 0 end)from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in   ('PLC31_FT1001_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumJinShuiTwo float=(select max(case h1.TagName    when  'PLC32_FT1001_Total' then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC32_FT1001_Total') AND  h1.wwResolution=3600000)
	--declare @currentSumPACOne float=(select max(case h1.TagName      when    'PLC1_FT1001_Total'  then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC1_FT1001_Total' ) AND  h1.wwResolution=3600000)
	--declare @currentSumPACTwo float=(select max(case h1.TagName        when  'PLC1_FT1002_Total'  then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC1_FT1002_Total' ) AND  h1.wwResolution=3600000)
	--declare @currentSumJiaLvQian float=(select max(case h1.TagName      when 'PLC1_FT2001_Total'  then Round(h1.Value,0) else 0 end)  from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC1_FT2001_Total' ) AND  h1.wwResolution=3600000)
	--declare @currentSumJiaLvHou float=(select max(case h1.TagName     when   'PLC1_FT2002_Total'  then Round(h1.Value,0) else 0 end) from Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in  ('PLC1_FT2002_Total' ) AND  h1.wwResolution=3600000)	
		DECLARE @TempTable1 TABLE(Seq INT IDENTITY, tempTagName NVARCHAR(256)) 
	INSERT @TempTable1(tempTagName) VALUES ('PLC4_FT2001_Total')
	DECLARE @RealValue float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC4_FT2001_Total'))
	
	INSERT @TempTable1(tempTagName) VALUES ('PLC4_FT1001_Total')
	DECLARE @RealValue2 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC4_FT1001_Total'))
	 	
	INSERT @TempTable1(tempTagName) VALUES ('PLC31_FT1001_Total')
	DECLARE @RealValue3 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC31_FT1001_Total'))

	INSERT @TempTable1(tempTagName) VALUES ('PLC32_FT1001_Total')
	DECLARE @RealValue4 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC32_FT1001_Total'))

	 	INSERT @TempTable1(tempTagName) VALUES ('PLC1_FT1001_Total')
	DECLARE @RealValue5 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC1_FT1001_Total'))

	 	INSERT @TempTable1(tempTagName) VALUES ('PLC1_FT1002_Total')
	DECLARE @RealValue6 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC1_FT1002_Total'))

	 	INSERT @TempTable1(tempTagName) VALUES ('PLC1_FT2001_Total')
	DECLARE @RealValue7 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC1_FT2001_Total'))

	 	 	INSERT @TempTable1(tempTagName) VALUES ('PLC1_FT2002_Total')
	DECLARE @RealValue8 float=(SELECT Value
	 FROM Runtime.dbo.v_AnalogLive
	LEFT JOIN @TempTable1 ON TagName = tempTagName
	 WHERE v_AnalogLive.TagName IN ('PLC1_FT2002_Total'))
	declare @maxtimeDay Datetime=(select max(Datetimes) from 广德二水厂累计流量表)
	
	insert into 广德二水厂瞬时流量表
	select 
	ROW_NUMBER() OVER (ORDER BY temp1.DateTimes asc) as 行号,
	temp1.Datetimes,
	--temp1.value,temp2.value-temp1.value
	--temp1.原水流量累计,temp2.原水流量累计-temp1.原水流量累计,
	--temp1.一号出水厂流量累计,temp2.一号出水厂流量累计-temp1.一号出水厂流量累计,
	--temp1.二号出水厂流量累计,temp2.二号出水厂流量累计-temp1.二号出水厂流量累计,
	--temp1.加药累计流量,temp2.加药累计流量-temp1.加药累计流量
	temp1.出厂水流量累计     ,temp2.出厂水流量累计     -temp1.出厂水流量累计     ,
	temp1.反冲洗流量累计     ,temp2.反冲洗流量累计     -temp1.反冲洗流量累计     ,
	temp1.一号进水流量累计   ,temp2.一号进水流量累计   -temp1.一号进水流量累计   ,
	temp1.二号进水流量累计   ,temp2.二号进水流量累计   -temp1.二号进水流量累计   ,
	temp1.一号PAC投加流量累计,temp2.一号PAC投加流量累计-temp1.一号PAC投加流量累计,
	temp1.二号PAC投加流量累计,temp2.二号PAC投加流量累计-temp1.二号PAC投加流量累计,
	temp1.前加氯投加流量累计 ,temp2.前加氯投加流量累计 -temp1.前加氯投加流量累计 ,
	temp1.后加氯投加流量累计 ,temp2.后加氯投加流量累计 -temp1.后加氯投加流量累计 

	from 广德二水厂累计流量表 temp1,广德二水厂累计流量表 temp2
	where temp1.id=temp2.id-1

	insert into 广德二水厂瞬时流量表
	select @counterDay,Datetimes,
	--原水流量累计,@currentSumValue-原水流量累计,
	--一号出水厂流量累计,@currentSumValueOne-一号出水厂流量累计,
	--二号出水厂流量累计,@currentSumValueTwo-二号出水厂流量累计,
	--加药累计流量,@currentSumValueAddMedicine-加药累计流量
	temp1.出厂水流量累计     ,@RealValue-  temp1.出厂水流量累计,
	temp1.反冲洗流量累计     ,@RealValue2-temp1.反冲洗流量累计,
	temp1.一号进水流量累计   ,@RealValue3-temp1.一号进水流量累计,
	temp1.二号进水流量累计   ,@RealValue4-temp1.二号进水流量累计,
	temp1.一号PAC投加流量累计,@RealValue5-    temp1.一号PAC投加流量累计,
	temp1.二号PAC投加流量累计,@RealValue6-    temp1.二号PAC投加流量累计,
	temp1.前加氯投加流量累计 ,@RealValue7- temp1.前加氯投加流量累计 ,
	temp1.后加氯投加流量累计 ,@RealValue8-  temp1.后加氯投加流量累计
	from 广德二水厂累计流量表 temp1
	where Datetimes=@maxtimeDay
end

else
begin
	set @counter=(select max(id) from 广德二水厂瞬时流量表)
	declare @maxtime datetime=(select max(Datetimes) from 广德二水厂瞬时流量表)--jc瞬时流量表中最大时间
	--判断目前的时间是否大于表中最大时间

	if datepart(hour,GETDATE())=DATEPART(hour,@maxtime) 
	and 
	datepart(year,GETDATE())=DATEPART(year,@maxtime) 
	and 
	datepart(month,GETDATE())=DATEPART(month,@maxtime) 
	and 
	datepart(DAY,GETDATE())=DATEPART(DAY,@maxtime)
	begin
			update 广德二水厂瞬时流量表 set 
			--vvalue=@RealValue-(select value from psj日瞬时流量表 where Datetimes=@maxtime)
			--原水瞬时流量=@RealValue-(select 原水流量累计 from ly进水厂水质累计报表 where Datetimes=@maxtime),
			--一号出厂水瞬时流量=@RealValue2-(select 一号出厂水流量累计 from ly进水厂水质累计报表 where Datetimes=@maxtime),
			--二号出厂水瞬时流量=@RealValue3-(select 二号出厂水流量累计 from ly进水厂水质累计报表 where Datetimes=@maxtime),
			--加药瞬时流量=@RealValue4-(select 加药累计流量 from ly进水厂水质累计报表 where Datetimes=@maxtime)
			出厂水瞬时流量		=@RealValue-  (select 出厂水流量累计      from 广德二水厂累计流量表 where Datetimes=@maxtime),
			反冲洗瞬时流量		=@RealValue2- (select 反冲洗流量累计      from 广德二水厂累计流量表 where Datetimes=@maxtime),
			一号进水瞬时流量	=@RealValue3- (select 一号进水流量累计    from 广德二水厂累计流量表 where Datetimes=@maxtime),
			二号进水瞬时流量	=@RealValue4- (select 二号进水流量累计    from 广德二水厂累计流量表 where Datetimes=@maxtime),
			一号PAC投加瞬时流量 =@RealValue5-(select 一号PAC投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),
			二号PAC投加瞬时流量 =@RealValue6-(select 二号PAC投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),
			前加氯投加瞬时流量	=@RealValue7- (select 前加氯投加流量累计  from 广德二水厂累计流量表 where Datetimes=@maxtime),
			后加氯投加瞬时流量	=@RealValue8- (select 后加氯投加流量累计  from 广德二水厂累计流量表 where Datetimes=@maxtime)
			where Datetimes=@maxtime
	end
	else if (datepart(hour,GETDATE())>DATEPART(hour,@maxtime) and datepart(year,GETDATE())=DATEPART(year,@maxtime) and datepart(month,GETDATE())=DATEPART(month,@maxtime) and datepart(DAY,GETDATE())=DATEPART(DAY,@maxtime)) 
	or 
	(datepart(year,GETDATE())>DATEPART(year,@maxtime) or datepart(month,GETDATE())>DATEPART(month,@maxtime) or datepart(DAY,GETDATE())>DATEPART(DAY,@maxtime))
	and DATEPART(minute,GETDATE())>=1
	begin

	update 广德二水厂瞬时流量表 set 
	出厂水瞬时流量=
	(
		select
		max(case h1.TagName	when 'PLC4_FT2001_Total'  then Round(h1.Value,0) else 0 end)
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC4_FT2001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 出厂水累计流量 from 广德二水厂累计流量表 where Datetimes=@maxtime),
	反冲洗瞬时流量=
	(
		select
		 max(case h1.TagName	when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end)
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC4_FT1001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 反冲洗流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),
	一号进水瞬时流量=
	(
		select
		max(case h1.TagName   when 'PLC31_FT1001_Total' then Round(h1.Value,0) else 0 end)
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC31_FT1001_Total' )
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 一号进水流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),

	二号进水瞬时流量=
	(
		select
		max(case h1.TagName   when 'PLC31_FT1002_Total' then Round(h1.Value,0) else 0 end)
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC31_FT1002_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 二号进水流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),

		一号PAC投加瞬时流量=
	(
		select
		max(case h1.TagName when 'PLC1_FT1001_Total' then Round(h1.Value,0) else 0 end) 原水累计流量
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT1001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 一号PAC投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),

		二号PAC投加瞬时流量=
	(
		select
		max(case h1.TagName when 'PLC1_FT1002_Total' then Round(h1.Value,0) else 0 end) 原水累计流量
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT1002_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 二号PAC投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),

	前加氯投加瞬时流量=
	(
		select
		max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end) 原水累计流量
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT2001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 前加氯投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime),

	后加氯投加瞬时流量=
	(
		select
		max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end) 原水累计流量
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT2002_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select 后加氯投加流量累计 from 广德二水厂累计流量表 where Datetimes=@maxtime)
	where Datetimes=@maxtime
	set @maxtime=dateadd(HH,1,@maxtime)
	
	while @maxtime<getdate() 
	and (DATEPART(year,@maxtime)!=DATEPART(year,getdate()) 
	or DATEPART(month,@maxtime)!=DATEPART(month,getdate()) 
	or DATEPART(day,@maxtime)!=DATEPART(day,getdate())  
	or DATEPART(HH,@maxtime)!=DATEPART(hh,getdate()))
	begin
			set @counter=@counter+1
			insert into 广德二水厂瞬时流量表
			--SELECT @counter+1,t2.时间 时间,t2.原水累计流量 原水累计流量,t3.原水累计流量-t2.原水累计流量 瞬时流量
			SELECT @counter,
			t1.时间,
			t1.一号配水井累计流量,t2.一号配水井累计流量-t1.一号配水井累计流量,
			t1.二号配水井累计流量,t2.二号配水井累计流量-t1.二号配水井累计流量,
			t1.三号配水井累计流量,t2.三号配水井累计流量-t1.三号配水井累计流量,
			t1.四号配水井累计流量,t2.四号配水井累计流量-t1.四号配水井累计流量,
			t1.紫外线进水流量累计,t2.紫外线进水流量累计 -t1.紫外线进水流量累计,
			t1.进水流量累计      ,t2.进水流量累计-t1.进水流量累计,
			t1.反洗水流量累计    ,t2.反洗水流量累计-t1.反洗水流量累计,
			t1.浓缩池出泥流量累计,t2.浓缩池出泥流量累计-t1.浓缩池出泥流量累计
			from
			(select ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as 行号,
			h1.DateTime as 时间,
			--max(case h1.TagName when 'PLC21_FT1015_Total' then Round(h1.Value,4) else 0 end) 原水累计流量
			max(case h1.TagName when 'PLC4_FT2001_Total' then Round(h1.Value,0) else 0 end)   出厂水流量累计    ,
			max(case h1.TagName when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end)  反冲洗流量累计    ,
			max(case h1.TagName when 'PLC31_FT1001_Total'  then Round(h1.Value,0) else 0 end)  一号进水流量累计  ,
			max(case h1.TagName when 'PLC32_FT1001_Total'   then Round(h1.Value,0) else 0 end) 二号进水流量累计  ,
			max(case h1.TagName when 'PLC1_FT1001_Total'   then Round(h1.Value,0) else 0 end) 一号PAC投加流量累计,
			max(case h1.TagName when 'PLC1_FT1002_Total'  then Round(h1.Value,0) else 0 end)  二号PAC投加流量累计,
			max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end)	前加氯投加流量累计,
			max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end)	后加氯投加流量累计
			from Runtime.dbo.History h1
			where h1.TagName in (
			 'PLC4_FT2001_Total' ,
			 'PLC4_FT1001_Total' ,
			 'PLC31_FT1001_Total',
			 'PLC32_FT1001_Total',
			 'PLC1_FT1001_Total' ,
			 'PLC1_FT1002_Total' ,
			 'PLC1_FT2001_Total' ,
			 'PLC1_FT2002_Total' 
			)
			AND h1.wwRetrievalMode='cyclic'
			and h1.DateTime >=@maxtime AND h1.DateTime < DATEADD(hh,1,@maxtime)
			and h1.wwResolution=3600000
			group by h1.DateTime) t1,
			(select top 1 ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as 行号,
			h1.DateTime as 时间,
			max(case h1.TagName when 'PLC4_FT2001_Total' then Round(h1.Value,0) else 0 end)   出厂水流量累计    ,
			max(case h1.TagName when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end)  反冲洗流量累计    ,
			max(case h1.TagName when 'PLC31_FT1001_Total'  then Round(h1.Value,0) else 0 end) 一号进水流量累计  ,
			max(case h1.TagName when 'PLC32_FT1001_Total'   then Round(h1.Value,0) else 0 end)二号进水流量累计  ,
			max(case h1.TagName when 'PLC1_FT1001_Total'   then Round(h1.Value,0) else 0 end) 一号PAC投加流量累计,
			max(case h1.TagName when 'PLC1_FT1002_Total'  then Round(h1.Value,0) else 0 end)  二号PAC投加流量累计,
			max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end)	  前加氯投加流量累计,
			max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end)	  后加氯投加流量累计
			from Runtime.dbo.History h1
			where h1.TagName in (
			 'PLC4_FT2001_Total' ,
			 'PLC4_FT1001_Total' ,
			 'PLC31_FT1001_Total',
			 'PLC32_FT1001_Total',
			 'PLC1_FT1001_Total' ,
			 'PLC1_FT1002_Total' ,
			 'PLC1_FT2001_Total' ,
			 'PLC1_FT2002_Total' 
			)
			AND h1.wwRetrievalMode='cyclic'
			and h1.DateTime >@maxtime and h1.DateTime<=DATEADD(hh,1,@maxtime)
			and h1.wwResolution=3600000
			group by h1.DateTime
			order by h1.DateTime Desc) t2
			set @maxtime=dateadd(HH,1,@maxtime)
	end
	set @counter=@counter+1
	insert into 广德二水厂瞬时流量表
	select @counter,@maxtime,
	出厂水流量累计,@RealValue-出厂水流量累计,
	反冲洗流量累计,@RealValue2-反冲洗流量累计,
	一号进水流量累计,@RealValue3-一号进水流量累计,
	二号进水流量累计,@RealValue4-二号进水流量累计,
	一号PAC投加流量累计,@RealValue5-一号PAC投加流量累计,
	二号PAC投加流量累计,@RealValue6-二号PAC投加流量累计,
	前加氯投加流量累计,@RealValue7-前加氯投加流量累计,
	后加氯投加流量累计,@RealValue8-后加氯投加流量累计
	from 广德二水厂累计流量表 where Datetimes=@maxtime
	end
end