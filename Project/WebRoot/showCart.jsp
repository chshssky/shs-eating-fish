<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="fish.operation.cart.*" import="com.cheating.hib.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>

	<style type="text/css">
	h1{ font-size: 10px}
	table
	{
		width:30%;
		font-size:15px;
		empty-cells:show;
		border-collapse:collapse;
		margin=0 auto;
		border: 1px solid #cad9ea;
	}
	
	td
	{
		height:20px;	
	}
	td,th
	{
		border:2px solid #cad9ea;
		padding:0 lem 0;
	}
	td:nth-child(2)
	{
		width:10%;
	}
	td:nth-child(3)
	{
		width:10%;
	}
	tr:nth-child(even)
	{
		background-color:#FFFFCC;
	}
	tr:nth-child(odd)
	{
		background-color:#FFFF99;
	}
	</style>




</head>
<body>

<div id="wrap">
<div class="head">
  <div class="logo">
   <a href="index.jsp"><img src="logo5.png" width="126" height="100"/></a>
  </div>
  <div class="welcome">
 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
  </div>
  <div class="ifLogin">
			<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
			<%
				System.out.println("index.jsp:LoginID:" + currUser.getId());
				if(currUser.getId() == 0) {
			%>
			<jsp:include page="HeadLoggedout.jsp"></jsp:include>
			<%
				} else {
			%>
			<jsp:include page="HeadLoggedin.jsp"></jsp:include>
			<%
				}
			%>
 </div>
</div>

<br>

<jsp:useBean id="mycart" class="fish.operation.cart.Cart" scope="session"/> 

<div class="course">
<center>
<table border="2">

			<tr align="center">
				<td>菜名</td>
				<td>数量</td>
				<td>单价</td>
				<td></td>
			</tr>


	<%	
		Iterator<Item> cart_list = mycart.getCart().iterator() ;	
		Item item = new Item() ;
		Courseinfo course = new Courseinfo();
		int sum_price = 0;
		
		while(cart_list.hasNext())
		{
			item = cart_list.next() ;
			course = (Courseinfo)HibernateSessionFactory.getSession().load(Courseinfo.class, item.getCourse_id()) ;
			sum_price += course.getPrice() ;
	%>
	<s:actionerror/>
	<tr align="center">	
		<td><%=course.getName()%></td>
		<td><%=item.getCourse_num()%></td>
		<td><%=course.getPrice()%></td>
		<td><form action="rmv_course">
			<input type="hidden" name="course_id" value=<%=item.getCourse_id()%>></input>
			<input type="submit" value="删除"></input>
		</form></td> 
	</tr>		 
	<%	
		}
	 %>
	</table>
	<form action="submit_order">
		总金额：<%=sum_price %>
		<input type="submit" value="提交订单"></input>
	</form>
			
</center>
</div>
</div>
<div id="foot">
  	<center>
    	<h4>版权所(@copy right)</h4>
    </center>
</div>

</body>
</html>
