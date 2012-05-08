<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Register Page</title>
</head>
	<body>
		<s:form action="register_check" >
			<s:label label="Username"/>
			<s:textfield name="username"/>
			<s:label label="Password"/>
			<s:password type="password" name="password"/>
			<s:label label="Confirm Password"/>
			<s:password name="repassword"/>
			<s:label label="Email Address"/>
			<s:textfield name="email"/>
			<s:submit/>
			<s:reset/>
		</s:form>
	</body>
</html>