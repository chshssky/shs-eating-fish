<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
	<body>
	<s:actionerror/>
		<form action="payment">
			<table>
				<tr>
					<td>请输入地址：</td>
					<td><input type="text" name="address"></input></td>
				</tr>
				
				<tr>
					<td><input type="submit" name="确认预订"></td>
				</tr>
			</table>
		</form>
	</body>
</html>