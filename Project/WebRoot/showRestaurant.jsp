<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="javax.swing.JOptionPane"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body topmargin="100" >
  
  	<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
  	<%
  		if(currUser.getId() != 0) 
  		{
  	 %>
 	<table>
 		<tr><td><a href="putCart.jsp">我的购物车</a></td></tr>
 		<tr/>
 		<tr/>
 	</table>
    
    <% }%>
    
    <table>
    <tr><td>你想浏览哪个饭店的菜肴呢？</td></tr>
    <tr><td><a href="showCourse.jsp?id=0" target="right" >全部店家</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=1" target="right">禾风韩国烧烤 五角场店</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=2" target="right">豆捞坊 五角场店</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=3" target="right">又一会</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=4" target="right">万裕采蝶轩 又一城店</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=5" target="right">观景台</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=6" target="right">晶采轩 虹桥店</a></td></tr>
    </table>
    
  </body>
</html>
