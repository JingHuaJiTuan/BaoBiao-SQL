create Database GuangDe
use GuangDe
create table ��¶�ˮ������ˮˮ�ʱ���(
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

create table ��¶�ˮ���˳�ϵͳ�Ǳ�(
	id int primary key not null,
	Datetimes Datetime not null,
	������ѹ�� float,
	����ˮѹ�� float,
	����ˮ���� float,
	����ϴ��ˮ��Һλ float,
	һ���˳�Һλ float,
	�����˳�Һλ float,
	һ�ž�ˮ����ˮ���� float,
	һ���˳�Һλ2 float,
	�����˳�Һλ2 float,
	���ž�ˮ����ˮ���� float

)

create table ��¶�ˮ����ҩ���ȼ䱨��(
	id int primary key not null,
	Datetimes Datetime not null,
	һ����Һ��Һλ float,
	������Һ��Һλ float,
	һ��PACͶ������ float,
	����PACͶ������ float,
	һ�Ŵ��ȹ�Һλ float,
	���Ŵ��ȹ�Һλ float,
	ǰ����Ͷ������  float,
	�����Ͷ������  float


)

create table ��¶�ˮ��������ˮϵͳ(
	id int primary key not null,
	Datetimes Datetime not null,
	һ����ˮ��Һλ float,
	������ˮ��Һλ float,
	һ�������Һλ float,
	���������Һλ float,
	һ��ƽ���Һλ float,
	����ƽ���Һλ float
)

create table ��¶�ˮ���ۼ������� (
	id int primary key not null,
	Datetimes Datetime not null,
	����ˮ�����ۼ� float,
	����ϴ�����ۼ� float,
	һ�Ž�ˮ�����ۼ� float,
	���Ž�ˮ�����ۼ� float,
	һ��PACͶ�������ۼ� float,
	����PACͶ�������ۼ� float,
	ǰ����Ͷ�������ۼ� float,
	�����Ͷ�������ۼ� float
)

create table ��¶�ˮ��˲ʱ������ (
	id int primary key not null,
	Datetimes Datetime not null,
	����ˮ�����ۼ� float,
	����ˮ˲ʱ���� float,
	����ϴ�����ۼ� float,
	����ϴ˲ʱ���� float,
	һ�Ž�ˮ�����ۼ� float,
	һ�Ž�ˮ˲ʱ���� float,
	���Ž�ˮ�����ۼ� float,
	���Ž�ˮ˲ʱ���� float,
	һ��PACͶ�������ۼ� float,
	һ��PACͶ��˲ʱ���� float,
	����PACͶ�������ۼ� float,
	����PACͶ��˲ʱ���� float,
	ǰ����Ͷ�������ۼ� float,
	ǰ����Ͷ��˲ʱ���� float,
	�����Ͷ�������ۼ� float,
	�����Ͷ��˲ʱ���� float
)