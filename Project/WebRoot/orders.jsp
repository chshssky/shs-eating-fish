<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="gb2312"%>
<link rel="stylesheet" media="screen" type="text/css" href="css/order.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>  
    <title>My JSP 'ShowMyOrder.jsp' starting page</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#CCFFFF">
  <div id="wrap">
  <div class="head">
  <div class="logo">
   <a href="index.jsp"><img src="logo5.png" width="126" height="100"/></a>
 
  </div>
  <div class="welcome">
 <h1>Welcome to</h1><h2> your orders </h2><br/><h1>欢迎</h1><h2>查看</h2><h1>订单</h1>
  </div>

  
    </div>
     <div class="block4">
		<ul id="navlist">
		<li><a href="#">我的订单:</a></li>
		<li><a href="index.jsp">返回首页</a></li>
		<li><a href="showRestaurant.jsp?id=0">查看餐馆信息</a></li>
		<li><a href="showCart.jsp">查看我的购物车</a></li>
		</ul>
		
	 </div>
     <div class="block3">
    	<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
    <%
    	int customerID = currUser.getId();
    	System.out.println(customerID);
    	Session se = HibernateSessionFactory.getSession();
		Customerinfo cusInfo = (Customerinfo)se.load(Customerinfo.class, customerID);

		Criteria crit = se.createCriteria(Orderinfo.class);
		crit.add(Restrictions.eq("customerinfo", cusInfo));
		List<Orderinfo> orderinfos = crit.list();
		if(orderinfos.isEmpty())
		{%>
		<h1>您目前暂时没有任何订单哦</h1>
		<%}
		else
		{
		
		for(Orderinfo info: orderinfos)
		{
			System.out.println(info.getOrderId());
			Criteria crit3 = se.createCriteria(Ordercourses.class);
			crit3.add(Restrictions.eq("orderinfo", info));
			List<Ordercourses> odcourses = crit3.list();
			%>
			<div class="eachOrder">
				<table align="center" border="2">
				<tr>
				<th>订单号:<%=info.getOrderId() %></th>
				<th colspan="2">订单生成时间：<%=String.valueOf(info.getOrderTime()) %></th>
				<th>总价格：<%=info.getSumPrice()%></th>
				<th>状态：<%=info.getState()%></th>
				</tr>
				<tr> 
				<td align="center">菜肴名</td>
				<td align="center">数量</td>
				<td align="center">单价</td>
				<td align="center">配送地址</td>
				<td align="center">订餐电话</td>
				</tr>
				<%
					for(Ordercourses info2: odcourses)
					{
						Session se3 = HibernateSessionFactory.getSession();
						Criteria crit4 = se3.createCriteria(Courseinfo.class);
						crit4.add(Restrictions.eq("courseId", info2.getCourseinfo().getCourseId()));
						List<Courseinfo> courseinfo = crit4.list();
						
				%>
							<tr>
						<td align="center"><%=courseinfo.get(0).getName()%></td>
						<td align="center"><%=info2.getNum()%></td>
						<td align="center"><%=courseinfo.get(0).getPrice() %></td>
						<td align="center"><%=info.getAddress()%></td>
						<td align="center"><%=info.getTelephoneNum()%></td>
						</tr>
			<%
					}
			 %>
			</table>
			</div>
		<%
		}}
		se.close();
    	  %>
    	  
     </div>
		
  	</div>
  	<div id="foot">
  	<center>
    <h4>版权所有(@all rights reserved) eating; chshs ; fish</h4>
    <h4>Any question please call 18801791172</h4>
    </center>

  </div> 
  
  
  
  
  
  
  	
    
  </body>
</html>
