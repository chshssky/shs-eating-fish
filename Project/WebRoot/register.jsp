<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/registerCss.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
<head>
	<title>Register Page</title>
</head>
	<body>
		
		<div class="wrapper">
		<h1><font color="#99CCFF">请填写注册信</font></h1>
		<s:form action="register_check" >
			<s:textfield name="username" cssStyle="background:url(text_field.png)" label="用户"/>
			<s:password name="password" cssStyle="background:url(text_field.png)" label="密码"/>
			<s:password name="repassword" cssStyle="background:url(text_field.png)" label="确认密码"/>
			<s:textfield name="firstname" cssStyle="background:url(text_field.png)" label="名"/>
			<s:textfield name="lastname" cssStyle="background:url(text_field.png)" label="姓"/>
			<s:textfield name="telephonenum" cssStyle="background:url()" label="电话号码"/>
			<s:textfield name="email" cssStyle="background:url(text_field.png)" label="邮箱"/>
			<s:submit value="注册"/>
			<s:reset value="重置"/>
		</s:form>
		</div>
		
	</body>
</html>