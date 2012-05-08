<%@ page language="java" import="java.util.*" import="com.cheating.SessionBean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上订餐系统</title>
	
  </head>
  
  <body>
  	<h1 align="center"><font color="#330099">欢迎来到EFC网上订餐系统</font></h1>
  	<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
  	<%
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
      
  </body>
</html>
