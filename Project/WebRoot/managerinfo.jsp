<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FFCC66">
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
		Session se = HibernateSessionFactory.getSession() ;
   		Managerinfo curMan = (Managerinfo)request.getSession().getAttribute("curManager") ;
	%>
	
	<div class="modifyCourse">
		<s:form action="maninfo">
			<!-- <div>
				<h1>名字：</h1>
				<input type="text" value=<%=curMan.getName() %> name="manName" class="input2" />
			</div>
			 -->
			 <%
			 	if(request.getSession().getAttribute("maninfoError") != null)
			 	{
			 		out.print("<script>alert('"+request.getSession().getAttribute("maninfoError")+"');</script>") ;
			 		request.getSession().removeAttribute("maninfoError") ;
			 	}
			  %>
			
			<div>
				<h1>请输入旧密码：</h1>
				<input type="password" value="" name="oldPass" class="input2" />
			</div>
			<br>
			
			<div>
				<h1>请输入新密码：</h1>
				<input type="password" value="" name="newPass" class="input2" />
			</div>
			
			<div>
				<h1>请重复新密码：</h1>
				<input type="password" value="" name="renewPass" class="input2" />
			</div>
			<br>
			
			<div>
       			<input type="submit" value="修改" class="input2"></input>
       		</div>
		</s:form>	
	</div>	
	
</div>
<div id="foot">
 	<center>
   		<h4>版权所有(@copy right)</h4>
   	</center>
</div>

</body>
</html>