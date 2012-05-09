<%@ page language="java" import="java.util.*" import="com.cheating.SessionBean.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <body>
  	<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
    <h3 align="right">
	  	  你好,  
	  	<a href="userinfo.jsp">
	  	<%=currUser.getFirstname() %>
	  	</a>   	
    	<a href="orders.jsp">订单</a>
    	<a href="cart.jsp">购物车</a>
    	<a href="logout.jsp">登出</a>
    </h3>
  </body>
</html>
