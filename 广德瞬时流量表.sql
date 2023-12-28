USE GuangDe
GO
/****** Object:  StoredProcedure [dbo].[proc_��ˮ��ˮ��˲ʱ�������]    Script Date: 2023/12/25 14:21:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[proc_��¶�ˮ��˲ʱ������]
as
declare @counter int =(select COUNT(id) from ��¶�ˮ��˲ʱ������)
--declare @currentvalue float = (select max(case h1.TagName when 'PLC21_FT1015_Total' then Round(h1.Value,4) else 0 end) from  Runtime.dbo.History h1 where h1.DateTime=GETDATE() and h1.TagName in ('PLC21_FT1015_Total') AND  h1.wwResolution=3600000)
--����Ϊ��ʱ--
if @counter<=0
begin
	declare @counterDay int =(select COUNT(id) from ��¶�ˮ���ۼ�������)
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
	declare @maxtimeDay Datetime=(select max(Datetimes) from ��¶�ˮ���ۼ�������)
	
	insert into ��¶�ˮ��˲ʱ������
	select 
	ROW_NUMBER() OVER (ORDER BY temp1.DateTimes asc) as �к�,
	temp1.Datetimes,
	--temp1.value,temp2.value-temp1.value
	--temp1.ԭˮ�����ۼ�,temp2.ԭˮ�����ۼ�-temp1.ԭˮ�����ۼ�,
	--temp1.һ�ų�ˮ�������ۼ�,temp2.һ�ų�ˮ�������ۼ�-temp1.һ�ų�ˮ�������ۼ�,
	--temp1.���ų�ˮ�������ۼ�,temp2.���ų�ˮ�������ۼ�-temp1.���ų�ˮ�������ۼ�,
	--temp1.��ҩ�ۼ�����,temp2.��ҩ�ۼ�����-temp1.��ҩ�ۼ�����
	temp1.����ˮ�����ۼ�     ,temp2.����ˮ�����ۼ�     -temp1.����ˮ�����ۼ�     ,
	temp1.����ϴ�����ۼ�     ,temp2.����ϴ�����ۼ�     -temp1.����ϴ�����ۼ�     ,
	temp1.һ�Ž�ˮ�����ۼ�   ,temp2.һ�Ž�ˮ�����ۼ�   -temp1.һ�Ž�ˮ�����ۼ�   ,
	temp1.���Ž�ˮ�����ۼ�   ,temp2.���Ž�ˮ�����ۼ�   -temp1.���Ž�ˮ�����ۼ�   ,
	temp1.һ��PACͶ�������ۼ�,temp2.һ��PACͶ�������ۼ�-temp1.һ��PACͶ�������ۼ�,
	temp1.����PACͶ�������ۼ�,temp2.����PACͶ�������ۼ�-temp1.����PACͶ�������ۼ�,
	temp1.ǰ����Ͷ�������ۼ� ,temp2.ǰ����Ͷ�������ۼ� -temp1.ǰ����Ͷ�������ۼ� ,
	temp1.�����Ͷ�������ۼ� ,temp2.�����Ͷ�������ۼ� -temp1.�����Ͷ�������ۼ� 

	from ��¶�ˮ���ۼ������� temp1,��¶�ˮ���ۼ������� temp2
	where temp1.id=temp2.id-1

	insert into ��¶�ˮ��˲ʱ������
	select @counterDay,Datetimes,
	--ԭˮ�����ۼ�,@currentSumValue-ԭˮ�����ۼ�,
	--һ�ų�ˮ�������ۼ�,@currentSumValueOne-һ�ų�ˮ�������ۼ�,
	--���ų�ˮ�������ۼ�,@currentSumValueTwo-���ų�ˮ�������ۼ�,
	--��ҩ�ۼ�����,@currentSumValueAddMedicine-��ҩ�ۼ�����
	temp1.����ˮ�����ۼ�     ,@RealValue-  temp1.����ˮ�����ۼ�,
	temp1.����ϴ�����ۼ�     ,@RealValue2-temp1.����ϴ�����ۼ�,
	temp1.һ�Ž�ˮ�����ۼ�   ,@RealValue3-temp1.һ�Ž�ˮ�����ۼ�,
	temp1.���Ž�ˮ�����ۼ�   ,@RealValue4-temp1.���Ž�ˮ�����ۼ�,
	temp1.һ��PACͶ�������ۼ�,@RealValue5-    temp1.һ��PACͶ�������ۼ�,
	temp1.����PACͶ�������ۼ�,@RealValue6-    temp1.����PACͶ�������ۼ�,
	temp1.ǰ����Ͷ�������ۼ� ,@RealValue7- temp1.ǰ����Ͷ�������ۼ� ,
	temp1.�����Ͷ�������ۼ� ,@RealValue8-  temp1.�����Ͷ�������ۼ�
	from ��¶�ˮ���ۼ������� temp1
	where Datetimes=@maxtimeDay
end

else
begin
	set @counter=(select max(id) from ��¶�ˮ��˲ʱ������)
	declare @maxtime datetime=(select max(Datetimes) from ��¶�ˮ��˲ʱ������)--jc˲ʱ�����������ʱ��
	--�ж�Ŀǰ��ʱ���Ƿ���ڱ������ʱ��

	if datepart(hour,GETDATE())=DATEPART(hour,@maxtime) 
	and 
	datepart(year,GETDATE())=DATEPART(year,@maxtime) 
	and 
	datepart(month,GETDATE())=DATEPART(month,@maxtime) 
	and 
	datepart(DAY,GETDATE())=DATEPART(DAY,@maxtime)
	begin
			update ��¶�ˮ��˲ʱ������ set 
			--vvalue=@RealValue-(select value from psj��˲ʱ������ where Datetimes=@maxtime)
			--ԭˮ˲ʱ����=@RealValue-(select ԭˮ�����ۼ� from ly��ˮ��ˮ���ۼƱ��� where Datetimes=@maxtime),
			--һ�ų���ˮ˲ʱ����=@RealValue2-(select һ�ų���ˮ�����ۼ� from ly��ˮ��ˮ���ۼƱ��� where Datetimes=@maxtime),
			--���ų���ˮ˲ʱ����=@RealValue3-(select ���ų���ˮ�����ۼ� from ly��ˮ��ˮ���ۼƱ��� where Datetimes=@maxtime),
			--��ҩ˲ʱ����=@RealValue4-(select ��ҩ�ۼ����� from ly��ˮ��ˮ���ۼƱ��� where Datetimes=@maxtime)
			����ˮ˲ʱ����		=@RealValue-  (select ����ˮ�����ۼ�      from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			����ϴ˲ʱ����		=@RealValue2- (select ����ϴ�����ۼ�      from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			һ�Ž�ˮ˲ʱ����	=@RealValue3- (select һ�Ž�ˮ�����ۼ�    from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			���Ž�ˮ˲ʱ����	=@RealValue4- (select ���Ž�ˮ�����ۼ�    from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			һ��PACͶ��˲ʱ���� =@RealValue5-(select һ��PACͶ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			����PACͶ��˲ʱ���� =@RealValue6-(select ����PACͶ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			ǰ����Ͷ��˲ʱ����	=@RealValue7- (select ǰ����Ͷ�������ۼ�  from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
			�����Ͷ��˲ʱ����	=@RealValue8- (select �����Ͷ�������ۼ�  from ��¶�ˮ���ۼ������� where Datetimes=@maxtime)
			where Datetimes=@maxtime
	end
	else if (datepart(hour,GETDATE())>DATEPART(hour,@maxtime) and datepart(year,GETDATE())=DATEPART(year,@maxtime) and datepart(month,GETDATE())=DATEPART(month,@maxtime) and datepart(DAY,GETDATE())=DATEPART(DAY,@maxtime)) 
	or 
	(datepart(year,GETDATE())>DATEPART(year,@maxtime) or datepart(month,GETDATE())>DATEPART(month,@maxtime) or datepart(DAY,GETDATE())>DATEPART(DAY,@maxtime))
	and DATEPART(minute,GETDATE())>=1
	begin

	update ��¶�ˮ��˲ʱ������ set 
	����ˮ˲ʱ����=
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
	(select ����ˮ�ۼ����� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
	����ϴ˲ʱ����=
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
	(select ����ϴ�����ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),
	һ�Ž�ˮ˲ʱ����=
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
	(select һ�Ž�ˮ�����ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),

	���Ž�ˮ˲ʱ����=
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
	(select ���Ž�ˮ�����ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),

		һ��PACͶ��˲ʱ����=
	(
		select
		max(case h1.TagName when 'PLC1_FT1001_Total' then Round(h1.Value,0) else 0 end) ԭˮ�ۼ�����
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT1001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select һ��PACͶ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),

		����PACͶ��˲ʱ����=
	(
		select
		max(case h1.TagName when 'PLC1_FT1002_Total' then Round(h1.Value,0) else 0 end) ԭˮ�ۼ�����
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT1002_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select ����PACͶ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),

	ǰ����Ͷ��˲ʱ����=
	(
		select
		max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end) ԭˮ�ۼ�����
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT2001_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select ǰ����Ͷ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime),

	�����Ͷ��˲ʱ����=
	(
		select
		max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end) ԭˮ�ۼ�����
		from Runtime.dbo.History h1
		where h1.TagName in ('PLC1_FT2002_Total')
		AND h1.wwRetrievalMode='Cyclic'
		and h1.DateTime >@maxtime AND h1.DateTime <= Dateadd(HH,1,@maxtime)
		and h1.wwResolution=3600000
		group by h1.DateTime
	)-
	(select �����Ͷ�������ۼ� from ��¶�ˮ���ۼ������� where Datetimes=@maxtime)
	where Datetimes=@maxtime
	set @maxtime=dateadd(HH,1,@maxtime)
	
	while @maxtime<getdate() 
	and (DATEPART(year,@maxtime)!=DATEPART(year,getdate()) 
	or DATEPART(month,@maxtime)!=DATEPART(month,getdate()) 
	or DATEPART(day,@maxtime)!=DATEPART(day,getdate())  
	or DATEPART(HH,@maxtime)!=DATEPART(hh,getdate()))
	begin
			set @counter=@counter+1
			insert into ��¶�ˮ��˲ʱ������
			--SELECT @counter+1,t2.ʱ�� ʱ��,t2.ԭˮ�ۼ����� ԭˮ�ۼ�����,t3.ԭˮ�ۼ�����-t2.ԭˮ�ۼ����� ˲ʱ����
			SELECT @counter,
			t1.ʱ��,
			t1.һ����ˮ���ۼ�����,t2.һ����ˮ���ۼ�����-t1.һ����ˮ���ۼ�����,
			t1.������ˮ���ۼ�����,t2.������ˮ���ۼ�����-t1.������ˮ���ۼ�����,
			t1.������ˮ���ۼ�����,t2.������ˮ���ۼ�����-t1.������ˮ���ۼ�����,
			t1.�ĺ���ˮ���ۼ�����,t2.�ĺ���ˮ���ۼ�����-t1.�ĺ���ˮ���ۼ�����,
			t1.�����߽�ˮ�����ۼ�,t2.�����߽�ˮ�����ۼ� -t1.�����߽�ˮ�����ۼ�,
			t1.��ˮ�����ۼ�      ,t2.��ˮ�����ۼ�-t1.��ˮ�����ۼ�,
			t1.��ϴˮ�����ۼ�    ,t2.��ϴˮ�����ۼ�-t1.��ϴˮ�����ۼ�,
			t1.Ũ���س��������ۼ�,t2.Ũ���س��������ۼ�-t1.Ũ���س��������ۼ�
			from
			(select ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as �к�,
			h1.DateTime as ʱ��,
			--max(case h1.TagName when 'PLC21_FT1015_Total' then Round(h1.Value,4) else 0 end) ԭˮ�ۼ�����
			max(case h1.TagName when 'PLC4_FT2001_Total' then Round(h1.Value,0) else 0 end)   ����ˮ�����ۼ�    ,
			max(case h1.TagName when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end)  ����ϴ�����ۼ�    ,
			max(case h1.TagName when 'PLC31_FT1001_Total'  then Round(h1.Value,0) else 0 end)  һ�Ž�ˮ�����ۼ�  ,
			max(case h1.TagName when 'PLC32_FT1001_Total'   then Round(h1.Value,0) else 0 end) ���Ž�ˮ�����ۼ�  ,
			max(case h1.TagName when 'PLC1_FT1001_Total'   then Round(h1.Value,0) else 0 end) һ��PACͶ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT1002_Total'  then Round(h1.Value,0) else 0 end)  ����PACͶ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end)	ǰ����Ͷ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end)	�����Ͷ�������ۼ�
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
			(select top 1 ROW_NUMBER() OVER (ORDER BY h1.DateTime asc) as �к�,
			h1.DateTime as ʱ��,
			max(case h1.TagName when 'PLC4_FT2001_Total' then Round(h1.Value,0) else 0 end)   ����ˮ�����ۼ�    ,
			max(case h1.TagName when 'PLC4_FT1001_Total'  then Round(h1.Value,0) else 0 end)  ����ϴ�����ۼ�    ,
			max(case h1.TagName when 'PLC31_FT1001_Total'  then Round(h1.Value,0) else 0 end) һ�Ž�ˮ�����ۼ�  ,
			max(case h1.TagName when 'PLC32_FT1001_Total'   then Round(h1.Value,0) else 0 end)���Ž�ˮ�����ۼ�  ,
			max(case h1.TagName when 'PLC1_FT1001_Total'   then Round(h1.Value,0) else 0 end) һ��PACͶ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT1002_Total'  then Round(h1.Value,0) else 0 end)  ����PACͶ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT2001_Total' then Round(h1.Value,0) else 0 end)	  ǰ����Ͷ�������ۼ�,
			max(case h1.TagName when 'PLC1_FT2002_Total' then Round(h1.Value,0) else 0 end)	  �����Ͷ�������ۼ�
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
	insert into ��¶�ˮ��˲ʱ������
	select @counter,@maxtime,
	����ˮ�����ۼ�,@RealValue-����ˮ�����ۼ�,
	����ϴ�����ۼ�,@RealValue2-����ϴ�����ۼ�,
	һ�Ž�ˮ�����ۼ�,@RealValue3-һ�Ž�ˮ�����ۼ�,
	���Ž�ˮ�����ۼ�,@RealValue4-���Ž�ˮ�����ۼ�,
	һ��PACͶ�������ۼ�,@RealValue5-һ��PACͶ�������ۼ�,
	����PACͶ�������ۼ�,@RealValue6-����PACͶ�������ۼ�,
	ǰ����Ͷ�������ۼ�,@RealValue7-ǰ����Ͷ�������ۼ�,
	�����Ͷ�������ۼ�,@RealValue8-�����Ͷ�������ۼ�
	from ��¶�ˮ���ۼ������� where Datetimes=@maxtime
	end
end