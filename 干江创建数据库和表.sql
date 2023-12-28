create Database GuangDe
use GuangDe
create table 广德二水厂进出水水质报表(
	id int primary key not null,
	Datetimes Datetime not null,
	原水浊度 float,
	原水PH float,
	出厂水浊度 float,
	出厂水PH float,
	出厂水氨氮 float,
	出厂水COD float,
	出厂水余氯 float,
	出厂水流量 float,
	清水池一号液位 float,
	清水池二号液位 float
)

create table 广德二水厂滤池系统仪表(
	id int primary key not null,
	Datetimes Datetime not null,
	反冲气压力 float,
	反冲水压力 float,
	反冲水流量 float,
	反冲洗清水池液位 float,
	一号滤池液位 float,
	二号滤池液位 float,
	一号净水器进水流量 float,
	一号滤池液位2 float,
	二号滤池液位2 float,
	二号净水器进水流量 float

)

create table 广德二水厂加药加氯间报表(
	id int primary key not null,
	Datetimes Datetime not null,
	一号溶液罐液位 float,
	二号溶液罐液位 float,
	一号PAC投加流量 float,
	二号PAC投加流量 float,
	一号储氯罐液位 float,
	二号储氯罐液位 float,
	前加氯投加流量  float,
	后加氯投加流量  float


)

create table 广德二水厂污泥脱水系统(
	id int primary key not null,
	Datetimes Datetime not null,
	一号排水池液位 float,
	二号排水池液位 float,
	一号排泥池液位 float,
	二号排泥池液位 float,
	一号平衡池液位 float,
	二号平衡池液位 float
)

create table 广德二水厂累计流量表 (
	id int primary key not null,
	Datetimes Datetime not null,
	出厂水流量累计 float,
	反冲洗流量累计 float,
	一号进水流量累计 float,
	二号进水流量累计 float,
	一号PAC投加流量累计 float,
	二号PAC投加流量累计 float,
	前加氯投加流量累计 float,
	后加氯投加流量累计 float
)

create table 广德二水厂瞬时流量表 (
	id int primary key not null,
	Datetimes Datetime not null,
	出厂水流量累计 float,
	出厂水瞬时流量 float,
	反冲洗流量累计 float,
	反冲洗瞬时流量 float,
	一号进水流量累计 float,
	一号进水瞬时流量 float,
	二号进水流量累计 float,
	二号进水瞬时流量 float,
	一号PAC投加流量累计 float,
	一号PAC投加瞬时流量 float,
	二号PAC投加流量累计 float,
	二号PAC投加瞬时流量 float,
	前加氯投加流量累计 float,
	前加氯投加瞬时流量 float,
	后加氯投加流量累计 float,
	后加氯投加瞬时流量 float
)