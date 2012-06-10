<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="com.cheating.hib.*" import="org.hibernate.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Information</title>
		</head>
	<body>
		<h1 align="center"><font color="#FF0099">用户信息</font></h1>
    <h2 align="right" ><font color="#FF99FF"><a href="index.jsp">返回</a></font></h2>
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
			顾客编号:<%=cus.getCustomerId() %><br>
			姓        ：<%=cus.getLastName() %><br>
			名        ：<%=cus.getFirstName()%><br>
			电话号码：<%=cus.getTelephoneNum() %><br>
			邮箱：<%=cus.getEmail() %><br>
		<%
			}
			else if(id == 1)
			{ 
		%>
			
			<s:form action="reset_email">
				<s:textfield type="text" name="reemail"/>
				<s:submit value="Reset Email"/>					
			</s:form>
			<%
			}
			else if(id == 2)
			{
			 %>
			<s:form action="reset_password">
				<s:label value="old password"/>
				<s:password name="old_pass"/>
					
				<s:label value="new password"/>
				<s:password name="new_pass"/>
				<s:submit value="Reset Password"/>
			</s:form>
			<%
			}
			 %>
		</center>
	</body>
</html>