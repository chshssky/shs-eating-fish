Create Database OrderOnlineDB;
use orderonlineDB;
create table CustomerInfo 
(
    CustomerID int(10) not null AUTO_INCREMENT,
    telephoneNum int(15),
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
values('禾风韩国烧烤 五角场店','杨浦区淞沪路151号中环国际大厦1楼近政通路',
 '禾风餐厅的料理品种丰富，据店经理介绍，他们的食材都是经过厨师长、料理长等
 相关负责人层层把关，确保每天提供给客人的都是优质、新鲜的食物','3');
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('豆捞坊 五角场店','杨浦区邯郸路600号万达广场食品一店4楼凇沪路',
'“豆捞”是上海目前“人气最旺”的火锅餐厅之一，“特色墨鱼滑”、“美味鲜虾滑面”
等各种特色滑类，是餐厅最受食客欢迎的人气涮品','3');
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('又一会','杨浦区淞沪路8号百联又一城购物中心7楼北侧近翔殷路',
'进门走廊很长，30来米，落地玻璃酒柜摆满了各种酒，琳琅满目。再进去一
点是一个环形的吧台，有各种酒水饮料，很有情调','3');
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('万裕采蝶轩 又一城店','杨浦区淞沪路8号百联又一城6楼近翔殷',
'大厅米色木墙上刻有不规则的镂空蝴蝶型翅膀，搭配浅灰色地毯，简洁大方。
靠窗位釉彩玻璃吊灯，独现小资风情','2');
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('观景台','浦东新区滨江大道2852号1楼沿江近丰和路',
'　整幢通透明丽的玻璃墙，靠窗位可以欣赏令人炫目的外滩景色，占了黄浦江边游轮码头的绝好位置','5');
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('晶采轩 虹桥店','长宁区虹桥路1937号西郊宾馆旁近虹许路',
'店内私密幽静的包房，采用了古色古香的装饰风格，气派宽敞，装饰的雍容华贵','5');

