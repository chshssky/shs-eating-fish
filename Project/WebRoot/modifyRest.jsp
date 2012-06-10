<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modify Restaurant Infomation</title>
</head>
<body bgcolor="#FFCC66">
	<%
		
		int restId = (Integer)request.getSession().getAttribute("restId") ; 
		Session se = HibernateSessionFactory.getSession() ;
		Restaurantinfo curRest = (Restaurantinfo)se.load(Restaurantinfo.class, restId) ;
	 %>
	 
 <div id="wrap">
	<div class="head">
	  <div class="logo">
	   <img src="logo5.png" width="126" height="100"/>
	  </div>
	  <div class="welcome">
	 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
	 	<h2> &nbsp &nbsp &nbsp &nbsp  &nbsp  &nbsp &nbsp &nbsp Manager Page</h2>
	 	&nbsp &nbsp &nbsp <a href="manager.jsp">return</a>
	 </div>
	</div>
	 
	 <%
	 	if(request.getSession().getAttribute("modiRestError") != null)
	  	{
	 		out.print("<script>alert('"+request.getSession().getAttribute("modiRestError")+"');</script>") ;
	 		request.getSession().removeAttribute("modiRestError") ;
	  	}
	  %>
	<s:form action="modifyRest">
	<div class="restinfo">
		<h1>饭店信息：</h1>
		<textArea name="restInfo" cols="50" rows="8"><%=curRest.getDescript() %></textArea>
		<div><input type="submit" value="修改" class="input2"/></div> 
	</div>
	</s:form>
	
   </div>
	<div id="foot">
  		<center>
    		<h4>版权所有(@copy right)</h4>
    	</center>
	</div> 
</body>
</html>