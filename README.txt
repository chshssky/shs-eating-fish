Hi fish~~
Hi eating~~
it's a test
another test
another test2
hahahahahahah~~~~~This is fish~~~~
Hi I'm eating.
I'm coming.........

现在，我们可以开始工作了：
一下就是工作日志--log:

2012/5/7:
	C：我创建了OrderOnlineDB.sql；
	我在里边初始化了数据库和各个表，应该挺全的了，大家看名字就应该能懂；
	我先插入了三条数据，就是咱们三个管理员的账号密码，
	接下来，大家如果要插入自己的测试数据的话（指大家手动的），可以在.sql里在下面接着写insert啥东东，这样每个人也可以用它添的一些必要数据
	当然，我指的是手动的，如果，是程序写入的，大家就不用再插入进来了，然后，.sql改了，每个人可以把改的部分在数据库中插入，也可以drop了自己的数据库，再用一遍.sql。。随你。。。
	数据还不全，谁有时间就加加，比如说，酒店信息丫啥的，还有菜品名丫啥的，记住外键不要出问题哦。。。。。
	不要把有bug的.sql提交上来哦。。。。
2012/5/7:
	E: 给restaurantinfo table里面增加了饭店信息，加到sql里面了，现在push上去，接下来我还要接着添加courseinfo里面的东西，再push上来

	我又加了菜品信息

	我写了两个jsp，实现了把菜品信息按餐馆列出的功能


2012/5/7:
	C：我写了index.jsp和login.jsp 及index.jsp包含的jsps只有login用了struts其他的都没用，所以还有待改进
	注意：在pull下来后，我们要先把hibernate.cfg.xml里的一些数据库连接信息改成自己的~~~E已经试过了，可以的。。

        E:这次我修改了数据库的ordercourses table，因为在读取数据的时候遇到问题，就增加了ordercoursesid 作为primary key。
	
2012/5/12:
	C:终于写完了登陆登出，注册，查询个人信息功能，能用index连起来了，但是觉得组织结构和预期的差好多啊。。。
	大家有啥建议快快提出啊。。。