<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.cheating.hib.*" import="org.hibernate.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/userInfo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Information</title>
		</head>
	<body>
	<div class="headline">
		<h1>用户信息</h1>
	</div>
		<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
		<%
			int id = Integer.valueOf(request.getParameter("param"));
			Session se = HibernateSessionFactory.getSession();
			//Criteria crit = se.createCriteria(Customerinfo.class);
			System.out.println("userInfo.jsp:LoginID:" + currUser.getId());
			Customerinfo cus = (Customerinfo)se.load(Customerinfo.class, currUser.getId());
			//List<Customerinfo> infos = crit.list();
		 %>
			 
		<center>
		<%
			if(id == 0)
			{ 
		%>
		<div>
		<ul border="1">
			<li>顾客编号:<%=cus.getCustomerId() %></li>
			<li>姓        ：<%=cus.getLastName() %></li>
			<li>名        ：<%=cus.getFirstName()%></li>
			<li>电话号码：<%=cus.getTelephoneNum() %></li>
			<li>邮箱：<%=cus.getEmail() %></li>
		</ul>
		</div>
		<%
			}
			else if(id == 1)
			{ 
		%>
			<div class="resetEmail">
			<fieldset>
			<legend><h2>重置email</h2></legend>
			<h2>请输入新的email</h2>
			<s:form action="reset_email">
				<s:textfield type="text" name="reemail"/>
				<s:submit value="Reset Email"/>					
			</s:form>
			</fieldset>
			</div>
			<%
			}
			else if(id == 2)
			{
			 %>
			 <div class="resetPassword">
			 <fieldset>
			 <legend><h2>重置密码</h2></legend>
			<s:form action="reset_password">
				<s:label cssStyle="font-family:Kristen ITC" value="old password"/>
				<s:password name="old_pass"/>
					
				<s:label cssStyle="font-family:Kristen ITC" value="new password"/>
				<s:password name="new_pass"/>
				<s:submit value="Reset Password"/>
			</s:form>
			</fieldset>
			</div>
			<%
			}
			 %>
		</center>
	</body>
</html>