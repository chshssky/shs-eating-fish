<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
pageEncoding="UTF-8" import="javax.swing.JOptionPane"%>
<link rel="stylesheet" media="screen" type="text/css" href="css/showRestAndCours.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
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
  
  <body bgcolor="#FFFFCC">
  
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
  
  <div class="restaurant">
 <%-- <%! int id;%>--%>
  	<%
  		if(currUser.getId() != 0) 
  		{
  	 %>
 	<table>
 		<tr><td><a href="showCart.jsp">我的购物车</a></td></tr>
 		<tr/>
 		<tr/>
 	</table>
    
    <% }%>
    
    <table>
    <tr><td>你想浏览哪个饭店的菜肴呢？</td></tr>
    <tr><td><a href="showRestaurant.jsp?id=0" target="right" >全部店家</a></td></tr>
    <%
		Session se = HibernateSessionFactory.getSession();
    	Criteria crit = se.createCriteria(Restaurantinfo.class);
    	List<Restaurantinfo> restinfos = crit.list();
		for(Restaurantinfo info:restinfos)
		{
	%>
    
    		<tr><td><a href="showRestaurant.jsp?id=<%=info.getRestaurantId()%>" target="right"><%=info.getName()%></a></td></tr>
    <% 
    	} 
    	se.close();
		int id =Integer.valueOf(request.getParameter("id"));
    %>
    </table>
    </div>
    <%-- <%@ include file="showCourse.jsp？param=id2" %> --%>
    <div class="course">
    <jsp:include page="showCourse.jsp"><jsp:param name="param" value="<%=id%>"></jsp:param>
    </jsp:include>
    </div>
   </div>
   

  </body>
</html>
