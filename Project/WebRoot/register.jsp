<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/registerCss.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
<head>
	<title>addManager Page</title>
</head>
	<body>
	<div class="head">
	<div class="logo">
	<a href="index.jsp"><img src="logo5.png" width="126" height="100" /></a>
	</div>
	<div class="welcome">
				<h1>欢迎来到</h1>
				<h2>注册</h2>
				<h1>页 面</h1>
			</div>
	</div>
        <div class="wrapper">
        <fieldset>
        <legend><h1><font color="#9933FF">注册信息</font></h1></legend>
		<s:form action="register_check" >
		<s:actionerror/>
			<s:textfield name="username" label="用户名"/>
			<s:password name="password" label="密码"/>
			<s:password name="repassword" label="确认密码"/>
			<s:textfield name="firstname" label="姓"/>
			<s:textfield name="lastname" label="名"/>
			<s:textfield name="telephonenum" label="电话号码"/>
			<s:textfield name="email" label="邮箱"/>
			<s:submit value="注册"/><s:reset value="重置"/>
		</s:form>
		<a href="index.jsp">返回主界面</a>	
		</fieldset>
		</div>
	<div id="foot">
		<center>
			<h4>版权所有(@all rights reserved) eating; chshs ; fish</h4>
			<h4>Any question please call 18801791172</h4>
		</center>

	</div>
	</body>
</html>