<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Register Page</title>
</head>
	<body>
		<center>
		<h1><font color="#FF0099">请填写注册信�/font></h1>
		<s:form action="register_check" >
			<s:textfield name="username" label="用户�/>
			<s:password name="password" label="密码"/>
			<s:password name="repassword" label="确认密码"/>
			<s:textfield name="email" label="邮箱"/>
			<s:submit value="注册"/>
			<s:reset value="重置"/>
		</s:form>
		</center>
	</body>
</html>