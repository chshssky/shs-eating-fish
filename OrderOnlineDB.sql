Create Database OrderOnlineDB;
use orderonlineDB;
create table courseType 
(
    id int(3) not null AUTO_INCREMENT,
    TypeName varchar(20) not null,
    primary key(id)
);
create table authority
(
    id int(1) not null AUTO_INCREMENT,
    AuthorName varchar(10) not null,
    primary key(id)
);
create table LoginInfo
(
    LoginID int(10) not null AUTO_INCREMENT,
    LoginName varchar(20) not null,
    Password varchar(20) not null,
    Authority int(1) default 1,
    primary key(LoginID),
    foreign key(Authority) references authority(id)
);
create table CustomerInfo 
(
    CustomerID int(10) not null AUTO_INCREMENT,
    telephoneNum varchar(15),
    firstName varchar(20),
    lastName varchar(20) not null,
    email varchar(30),
    LoginID int(10),
    primary key(CustomerID),
    foreign key(LoginID) references LoginInfo(LoginID)
);
create table RestaurantInfo
(
    RestaurantID int(10) not null AUTO_INCREMENT,
    Name varchar(50) not null,
    address varchar(255) not null,
    Descript varchar(255),
    latitude float(10),
    longtitude float(10),
    managerUpBound int(10),
    primary key(RestaurantID)
);
create table ManagerInfo
(
    ManagerID int(10) not null AUTO_INCREMENT,
    Name varchar(20),
    RestaurantID int(10),
    LoginID int(10),
    primary key(ManagerID),
    foreign key(RestaurantID) references RestaurantInfo(RestaurantID),
    foreign key(LoginID) references LoginInfo(LoginID)
);
create table CourseInfo
(
    CourseID int(10) not null AUTO_INCREMENT,
    Name varchar(50) not null,
    Descript varchar(255),
    price int(10) not null,
    type int(3) ,
    pic varchar(200),
    RestaurantID int(10),
    primary key(CourseID),
    foreign key(RestaurantID) references RestaurantInfo(RestaurantID),
    foreign key(type) references courseType(id)
);
create table OrderInfo
(
    OrderID int(10) not null AUTO_INCREMENT,
    address varchar(255) not null,
    telephoneNum varchar(15),
    firstName varchar(20),
    lastName varchar(20) not null,
    sumPrice int(10),
    orderTime TIMESTAMP default current_timestamp,
    demandTime DATETIME,
    state varchar(20) default 'dealing',
    CustomerID int(10),
    primary key(OrderID),
    foreign key(CustomerID) references CustomerInfo(CustomerID)
);
create table OrderCourses
(
    OrderCoursesID int(10) not null AUTO_INCREMENT,
    num int(10) not null,
    OrderID int(10),
    CourseID int(10),
    primary key(OrderCoursesID),
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
    Name varchar(20),
    LoginID int(10),
    primary key(AdID),
    foreign key(LoginID) references LoginInfo(LoginID)
);
insert into authority(authorname) values('customer');
insert into authority(authorname) values('manager');
insert into authority(authorname) values('admin');

insert into courseType(Typename) values('主食');
insert into courseType(Typename) values('饮品');
insert into courseType(Typename) values('凉菜');
insert into courseType(Typename) values('炒菜');
insert into courseType(Typename) values('招牌');
insert into courseType(Typename) values('汤类');
insert into courseType(Typename) values('甜品');
insert into courseType(Typename) values('海鲜');
insert into courseType(Typename) values('排类');
insert into courseType(Typename) values('鱼类');

insert into LoginInfo(LoginName, password, authority) values('ch', 'hc', 3);
insert into LoginInfo(LoginName, password, authority) values('eating', 'gnitae', 3);
insert into LoginInfo(LoginName, password, authority) values('fish', 'hsif', 3);

insert into AdministratorInfo(Name, LoginID) values('崔昊', 1);
insert into AdministratorInfo(Name, LoginID) values('意婷', 2);
insert into AdministratorInfo(Name, LoginID) values('于航', 3);


insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude) 
values('禾风韩国烧烤 五角场店','杨浦区淞沪路151号中环国际大厦1楼近政通路',
 '禾风餐厅的料理品种丰富，据店经理介绍，他们的食材都是经过厨师长、料理长等
 相关负责人层层把关，确保每天提供给客人的都是优质、新鲜的食物',3, 31.307595, 121.514111);
insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude)
values('新宋记香辣蟹 长阳店','杨浦区长阳路1675号近黄兴路',
'提起香辣蟹，上海人最先想到的，必定是宋记，在上海开了10多年，人气够旺，口味够好！',
3, 31.274149, 121.534367);
insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude)
values('牛市','虹口区沙泾路10号1933老场坊1幢2楼近溧阳路',
'“牛市”，绝对是1933老场房里“最牛”的餐厅，在一片原始水泥的林立中蜕变成神秘而又时尚的创意园区',
3, 31.260063, 121.491451);
insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude)
values('同济戴斯大酒店','杨浦区彰武路50号同济戴斯大酒店2楼近四平路',
'暖色调的装修，典雅华丽。精心设计的菜单上，不同食材被分类并标注菜系，以满足客人的不同口味。
服务有求必应，最值得“褒奖”，很适合商务宴请。',2, 31.285006, 121.509132);
insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude)
values('观景台','浦东新区滨江大道2852号1楼沿江近丰和路',
'整幢通透明丽的玻璃墙，靠窗位可以欣赏令人炫目的外滩景色，占了黄浦江边游轮码头的绝好位置',5,
31.246416, 121.496944);
insert into restaurantinfo(name, address, Descript, managerUpBound, latitude, longtitude)
values('长春不老私房菜','虹口区长春路101号福馨宾馆近溧阳路',
'长春不老私房菜，绝对是虹口区高档的宴请餐厅，全包房设计，隐秘性极好。VIP包房装修像皇宫一样
，仅一套“帝王黄骨瓷”餐具就价值10万，倍显尊贵。Ipad图片点菜，紧跟潮流时尚'
,5, 31.264172, 121.485100);




insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('大虾创意寿司','独特造型的大虾寿司，不仅在味道上保留的传统的风格，
还加入了创新的元素，使之色香味更具个性',39,1, 7, 'pictures/daxia.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('禾风牛排','后用炭火上烤至七成熟，其肉质紧实嫩滑，入口咸鲜适中',68,1,9, 'pictures/niupai.jsp');


insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('缤纷海鲜组合（小）','涮生蚝、响螺海肠、墨鱼仔、蟹腿、蛏子、草虾',79,2,8, 'pictures/haixian.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('菌王锅','各式菌菇，在煨制3小时的老鸡汤内，吸足了“油水”，滋味不凡',12,2,6, 'pictures/junwang.jsp');



insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('豆鼓蒸凤爪','只需轻吮，便整骨脱出，口齿留香，就连啃着酥软的骨头也是一种乐趣。',18,3,5, 'pictures/fengzhua.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('泰皇咖喱','挑选丰腴肥美的鲜活青蟹，配以鸽子熬制的高汤和原汁原味的泰式黄咖喱',168,3,1, 'pictures/taihuang.jsp');

insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('木瓜芝士虾','木瓜芝士虾”，必选新鲜活虾，搭配“马苏里拉芝士”和木瓜烤而成',88,4,8, 'pictures/mugua.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('越式煎羊排','肉质相对鲜嫩。用秘制酱料腌制来保持其更为入味，采用正宗的越式做法，羊排滋味更为浓厚',16,4,9,'pictures/yangpai.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('烟熏鲑鱼','鲜嫩美味，再加上些烟熏口感，更是滋味无穷。',53,5,10, 'pictures/guiyu.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('上海熏鱼','色泽酱红油亮，肉质细密鲜嫩，外皮酥而不硬',69,5,10, 'pictures/xunyu.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type, pic) values
('龙虾汤','龙虾取自大明湖畔的夏雨荷下，虾肉甜美。',53,6,6, 'pictures/longxia.jsp');
insert into courseinfo(name, descript, price, RestaurantID, type,pic) values
('文火焖小牛肉','餐厅选用的质感柔嫩的顶级雪花牛肉，加上秘制酱料文火焖制而成，绵软酥烂',69,6,5,'pictures/wenhuo.jsp');


