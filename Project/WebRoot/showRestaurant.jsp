<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
pageEncoding="UTF-8" import="javax.swing.JOptionPane"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
    <%
		Session se = HibernateSessionFactory.getSession();
    	Criteria crit = se.createCriteria(Restaurantinfo.class);
    	List<Restaurantinfo> restinfos = crit.list();
		for(Restaurantinfo info:restinfos)
		{
	%>
    
    <tr><td><a href="showCourse.jsp?id=<%=info.getRestaurantId()%>" target="right"><%=info.getName()%></a></td></tr>
    <% } %>
    </table>
    
  </body>
</html>
