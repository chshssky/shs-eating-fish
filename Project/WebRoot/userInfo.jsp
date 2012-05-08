<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include  file="userInfoMenu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Information</title>
		</head>
	<body>
		<center>
			<s:label value="Your Username"/><br>
			<s:label value="fish"/><br>	<%//这里显示当前用户名 %>
			<s:label value="Your Email Address"/><br>
			<s:label value="smile_bogeyman@163.com"/><br>
			
			<s:form action="reset_email">
				<s:textfield type="text" name="reemail"/>
				<s:submit value="Reset Email"/>					
			</s:form>
			
			<s:form action="reset_password">
				<s:label value="old password"/>
				<s:password name="old_pass"/>
					
				<s:label value="new password"/>
				<s:password name="new_pass"/>
				<s:submit value="Reset Password"/>
			</s:form>
		</center>
	</body>
</html>