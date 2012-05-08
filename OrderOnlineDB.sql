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
values('禾风韩国烧烤 五角场店','杨浦区淞沪路151号中环国际大厦1楼近政通路',
 '禾风餐厅的料理品种丰富，据店经理介绍，他们的食材都是经过厨师长、料理长等
 相关负责人层层把关，确保每天提供给客人的都是优质、新鲜的食物',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('豆捞坊 五角场店','杨浦区邯郸路600号万达广场食品一店4楼凇沪路',
'“豆捞”是上海目前“人气最旺”的火锅餐厅之一，“特色墨鱼滑”、“美味鲜虾滑面”
等各种特色滑类，是餐厅最受食客欢迎的人气涮品',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('又一会','杨浦区淞沪路8号百联又一城购物中心7楼北侧近翔殷路',
'进门走廊很长，30来米，落地玻璃酒柜摆满了各种酒，琳琅满目。再进去一
点是一个环形的吧台，有各种酒水饮料，很有情调',3);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('万裕采蝶轩 又一城店','杨浦区淞沪路8号百联又一城6楼近翔殷',
'大厅米色木墙上刻有不规则的镂空蝴蝶型翅膀，搭配浅灰色地毯，简洁大方。
靠窗位釉彩玻璃吊灯，独现小资风情',2);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('观景台','浦东新区滨江大道2852号1楼沿江近丰和路',
'　整幢通透明丽的玻璃墙，靠窗位可以欣赏令人炫目的外滩景色，占了黄浦江边游轮码头的绝好位置',5);
insert into restaurantinfo(name, address, Descript, managerUpBound)
values('晶采轩 虹桥店','长宁区虹桥路1937号西郊宾馆旁近虹许路',
'店内私密幽静的包房，采用了古色古香的装饰风格，气派宽敞，装饰的雍容华贵',5);




insert into courseinfo(name, descript, price, RestaurantID) values
('大虾创意寿司','独特造型的大虾寿司，不仅在味道上保留的传统的风格，
还加入了创新的元素，使之色香味更具个性',39,1);
insert into courseinfo(name, descript, price, RestaurantID) values
('禾风牛排','后用炭火上烤至七成熟，其肉质紧实嫩滑，入口咸鲜适中',68,1);


insert into courseinfo(name, descript, price, RestaurantID) values
('缤纷海鲜组合（小）','涮生蚝、响螺海肠、墨鱼仔、蟹腿、蛏子、草虾',79,2);
insert into courseinfo(name, descript, price, RestaurantID) values
('菌王锅','各式菌菇，在煨制3小时的老鸡汤内，吸足了“油水”，滋味不凡',12,2);



insert into courseinfo(name, descript, price, RestaurantID) values
('豆鼓蒸凤爪','，只需轻吮，便整骨脱出，口齿留香，就连啃着酥软的骨头也是一种乐趣。',18,3);
insert into courseinfo(name, descript, price, RestaurantID) values
('泰皇咖喱','挑选丰腴肥美的鲜活青蟹，配以鸽子熬制的高汤和原汁原味的泰式黄咖喱',168,3);

insert into courseinfo(name, descript, price, RestaurantID) values
('木瓜芝士虾','木瓜芝士虾”，必选新鲜活虾，搭配“马苏里拉芝士”和木瓜烤而成',88,4);
insert into courseinfo(name, descript, price, RestaurantID) values
('越式煎羊排','肉质相对鲜嫩。用秘制酱料腌制来保持其更为入味，采用正宗的越式做法，羊排滋味更为浓厚',16,4);
insert into courseinfo(name, descript, price, RestaurantID) values
('烟熏鲑鱼','鲜嫩美味，再加上些烟熏口感，更是滋味无穷。',53,5);
insert into courseinfo(name, descript, price, RestaurantID) values
('上海熏鱼','色泽酱红油亮，肉质细密鲜嫩，外皮酥而不硬',69,5);
insert into courseinfo(name, descript, price, RestaurantID) values
('龙虾汤过桥象','龙虾取自大明湖畔的夏雨荷下，虾肉甜美。',53,6);
insert into courseinfo(name, descript, price, RestaurantID) values
('文火焖小牛肉','餐厅选用的质感柔嫩的顶级雪花牛肉，加上秘制酱料文火焖制而成，绵软酥烂',69,6);
insert into customerinfo(telephoneNum,firstName,lastName,email)
values('15000802026','Yiting','Zhang','948164356@qq.com');
insert into logininfo(LoginName,Password,CustomerID)
values('eating','1234',1);
insert into orderinfo(address,sumPrice,CustomerID)
values('上海市嘉定区曹安路4800号同济大学',296,1);
insert into ordercourses(num,OrderID,CourseID)
values(1,1,1);

insert into ordercourses(num,OrderID,CourseID)
values(1,1,4);

insert into ordercourses(num,OrderID,CourseID)
values(2,1,7);

insert into ordercourses(num,OrderID,CourseID)
values(1,1,10);
