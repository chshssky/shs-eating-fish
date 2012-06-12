<%@ page language="java" import="java.util.*" import="com.cheating.SessionBean.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <body>
  	<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
    <h3 align="left">
	  	  你好,  
	  	<a href="showUserInfo.jsp?id=0">
	  	<%=currUser.getFirstname() %>
	  	</a>
	  	<br>
	</h3>
	<h3 align="right">  	   	
    	<a href="orders.jsp">历史订单</a>
    	<a href="handleOrder.jsp">未处理订单</a>
    	<a href="showCart.jsp">购物车</a>
    	<a href="logout.jsp">登出</a>  
    </h3>
  </body>
</html>
