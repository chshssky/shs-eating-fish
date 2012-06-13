<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/payOrder.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>
<%@ taglib uri="/struts-dojo-tags" prefix="sx" %>
<html>
<head>
<title>order</title>
	<sx:head/>
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
	
	
		<form action="payment">
			<div class="input">
			<s:actionerror/>
				请输入地址�br>
				<input type="text" name="address"></input><br><br>
				请输入联系人姓名�br>
				�input size="2px" type="text" name="lastName"></input>
				�input size="2px" type="text" name="firstName"></input><br><br>
				请输入联系人电话�br>
				<input type="text" name="telephoneNum"></input><br><br>
				请选择送餐时间�br>
				<sx:datetimepicker name="demandDate" type="date" toggleDuration="explode" displayFormat="yyyy-MM-dd" ></sx:datetimepicker>
				<sx:datetimepicker name="demandTime" type="time" toggleDuration="explode" displayFormat="HH:mm:ss" ></sx:datetimepicker>
				<br><br>
				
				<input type="submit" class="input2" value="确认预订">
				<input type="button" value="以后再处� class="input2" onclick="window.location='index.jsp'"/>
			</div>
		</s:form>
	</div>
    <div id="foot">
  		<center>
    		<h4>版权所�@copy right)</h4>
    	</center>
  	</div>		
	</body>
</html>