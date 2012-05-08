Create Database OrderOnlineDB;
use orderonlineDB;
create table CustomerInfo 
(
    CustomerID int(10) not null AUTO_INCREMENT,
    telephoneNum varchar(15),
    firstName varchar(20),
    lastName varchar(20) not null,
    email varchar(30),
    primary key(CustomerID)
);
create table LoginInfo
(
    LoginID int(10) not null AUTO_INCREMENT,
    LoginName varchar(20) not null,
    Password varchar(20) not null,
    CustomerID int(10),
    primary key(LoginID),
    foreign key(CustomerID) references CustomerInfo(CustomerID)
);
create table RestaurantInfo
(
    RestaurantID int(10) not null AUTO_INCREMENT,
    Name varchar(50) not null,
    address varchar(255) not null,
    Descript varchar(255),
    managerUpBound int(10),
    primary key(RestaurantID)
);
create table ManagerInfo
(
    ManagerID int(10) not null AUTO_INCREMENT,
    LoginName varchar(20) not null,
    Password varchar(20) not null,
    RestaurantID int(10),
    primary key(ManagerID),
    foreign key(RestaurantID) references RestaurantInfo(RestaurantID)
);
create table CourseInfo
(
    CourseID int(10) not null AUTO_INCREMENT,
    Name varchar(50) not null,
    Descript varchar(255),
    price int(10) not null,
    RestaurantID int(10),
    primary key(CourseID),
    foreign key(RestaurantID) references RestaurantInfo(RestaurantID)
);
create table OrderInfo
(
    OrderID int(10) not null AUTO_INCREMENT,
    address varchar(255) not null,
    sumPrice int(10),
    orderTime TIMESTAMP not null default current_timestamp,
    state varchar(20) default 'dealing',
    CustomerID int(10),
    primary key(OrderID),
    foreign key(CustomerID) references CustomerInfo(CustomerID)
);
create table OrderCourses
(
    num int(10) not null,
    OrderID int(10),
    CourseID int(10),
    foreign key(OrderID) references OrderInfo(OrderID),
    foreign key(CourseID) references CourseInfo(CourseID)
);
create table reservationInfo
(
    OrderID int(10) not null AUTO_INCREMENT,
    orderTime TIMESTAMP not null default current_timestamp,
    state varchar(20) default 'dealing',
    CustomerID int(10),
    RestaurantID int(10),
    primary key(OrderID),
    foreign key(CustomerID) references CustomerInfo(CustomerID),
    foreign key(RestaurantID) references RestaurantInfo(RestaurantID)
);
create table AdministratorInfo
(
    AdID int(10) not null AUTO_INCREMENT,
    LoginName varchar(20) not null,
    password varchar(20) not null,
    primary key(AdID)
);
insert into AdministratorInfo(LoginName, password) values('ch', 'hc');
insert into AdministratorInfo(LoginName, password) values('eating', 'gnitae');
insert into AdministratorInfo(LoginName, password) values('fish', 'hsif');


insert into restaurantinfo(name, address, Descript, managerUpBound) 
values('�̷纫���տ� ��ǳ���','����������·151���л����ʴ���1¥����ͨ·',
 '�̷����������Ʒ�ַḻ���ݵ꾭����ܣ����ǵ�ʳ�Ķ��Ǿ�����ʦ����������
 ��ظ����˲��ѹأ�ȷ��ÿ���ṩ�����˵Ķ������ʡ����ʵ�ʳ��',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('���̷� ��ǳ���','����������·600�����㳡ʳƷһ��4¥ڡ��·',
'�����̡����Ϻ�Ŀǰ�������������Ļ������֮һ������ɫī�㻬��������ζ��Ϻ���桱
�ȸ�����ɫ���࣬�ǲ�������ʳ�ͻ�ӭ��������Ʒ',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('��һ��','����������·8�Ű�����һ�ǹ�������7¥���������·',
'�������Ⱥܳ���30���ף���ز����ƹ�����˸��־ƣ�������Ŀ���ٽ�ȥһ
����һ�����εİ�̨���и��־�ˮ���ϣ��������',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('��ԣ�ɵ��� ��һ�ǵ�','����������·8�Ű�����һ��6¥������',
'������ɫľǽ�Ͽ��в�������οպ����ͳ�򣬴���ǳ��ɫ��̺�����󷽡�
����λ�Բʲ������ƣ�����С�ʷ���',2);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('�۾�̨','�ֶ������������2852��1¥�ؽ������·',
'������ͨ͸�����Ĳ���ǽ������λ��������������Ŀ����̲��ɫ��ռ�˻��ֽ���������ͷ�ľ���λ��',5);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('������ ���ŵ�','����������·1937�����������Խ�����·',
'����˽���ľ��İ����������˹�ɫ�����װ�η�����ɿ���װ�ε�Ӻ�ݻ���',5);




insert into courseinfo(name, descript, price, RestaurantID) values
('��Ϻ������˾','�������͵Ĵ�Ϻ��˾��������ζ���ϱ����Ĵ�ͳ�ķ��
�������˴��µ�Ԫ�أ�ʹ֮ɫ��ζ���߸���',39,1);
insert into courseinfo(name, descript, price, RestaurantID) values
('�̷�ţ��','����̿���Ͽ����߳��죬�����ʽ�ʵ�ۻ��������������',68,1);


insert into courseinfo(name, descript, price, RestaurantID) values
('�ͷ׺�����ϣ�С��','����򺡢���ݺ�����ī���С�з�ȡ����ӡ���Ϻ',79,2);
insert into courseinfo(name, descript, price, RestaurantID) values
('������','��ʽ������������3Сʱ���ϼ����ڣ������ˡ���ˮ������ζ����',12,2);



insert into courseinfo(name, descript, price, RestaurantID) values
('��������צ','��ֻ����˱���������ѳ����ڳ����㣬������������Ĺ�ͷҲ��һ����Ȥ��',18,3);
insert into courseinfo(name, descript, price, RestaurantID) values
('̩�ʿ��','��ѡ����������ʻ���з�����Ը��Ӱ��Ƶĸ�����ԭ֭ԭζ��̩ʽ�ƿ��',168,3);

insert into courseinfo(name, descript, price, RestaurantID) values
('ľ��֥ʿϺ','ľ��֥ʿϺ������ѡ���ʻ�Ϻ�����䡰��������֥ʿ����ľ�Ͽ�����',88,4);
insert into courseinfo(name, descript, price, RestaurantID) values
('Խʽ������','����������ۡ������ƽ����������������Ϊ��ζ���������ڵ�Խʽ������������ζ��ΪŨ��',16,4);
insert into courseinfo(name, descript, price, RestaurantID) values
('��Ѭ����','������ζ���ټ���Щ��Ѭ�ڸУ�������ζ���',53,5);
insert into courseinfo(name, descript, price, RestaurantID) values
('�Ϻ�Ѭ��','ɫ�󽴺�����������ϸ�����ۣ���Ƥ�ֶ���Ӳ',69,5);
insert into courseinfo(name, descript, price, RestaurantID) values
('��Ϻ��������','��Ϻȡ�Դ������ϵ�������£�Ϻ��������',53,6);
insert into courseinfo(name, descript, price, RestaurantID) values
('�Ļ���Сţ��','����ѡ�õ��ʸ����۵Ķ���ѩ��ţ�⣬�������ƽ����Ļ����ƶ��ɣ���������',69,6);
insert into customerinfo(telephoneNum,firstName,lastName,email)
values('15000802026','Yiting','Zhang','948164356@qq.com');
insert into logininfo(LoginName,Password,CustomerID)
values('eating','1234',1);
insert into orderinfo(address,sumPrice,CustomerID)
values('�Ϻ��мζ����ܰ�·4800��ͬ�ô�ѧ',296,1);
insert into ordercourses(num,OrderID,CourseID)
values(1,1,1);

insert into ordercourses(num,OrderID,CourseID)
values(1,1,4);

insert into ordercourses(num,OrderID,CourseID)
values(2,1,7);

insert into ordercourses(num,OrderID,CourseID)
values(1,1,10);
