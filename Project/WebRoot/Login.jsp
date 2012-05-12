<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  		<center>
  		
  		<a href="register.jsp">注册</a>
  		
  		<h1><font color="#FF0099">欢迎登陆</font></h1>
    <h2 align="right" ><font color="#FF99FF"><a href="index.jsp">返回</a></font></h2>
		<s:form action="login_check">
			<s:textfield name="loginName" label="用户名"></s:textfield>
			<s:password name="password" label="密码"></s:password>
			<s:radio name="userType" label="用户类型" list="{'管理员', '顾客', '经理'}"></s:radio> 
			<s:submit value="登陆"/><s:reset value="重置"/>
			
		</s:form>
		</center>
  </body>
</html>
