<%@ page language="java" import="java.util.*"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'deleteManager.jsp' starting page</title>
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
  	<%
  		int id = Integer.valueOf(request.getParameter("id"));
  		if (id == 0) 
  		{
  	 %>
  	 <h1>输入管理员名有误，请重新输入</h1>
  	 <% 
  	 	}
  	  %>
    <fieldset id="fieldset">
    <legend>添加信息</legend>
  	<s:actionerror/>
    <s:form action="deleteManagerB">
    		<s:textfield name="loginName" label="输入你要删除的管理员登录名"/>
			<s:submit value="删除"/>
			<s:reset value="重置"/>
	</s:form>
		</fieldset>
	<%
		if(id == 1)
		{%>
			<jsp:include page="acknowledgeDelete.jsp"></jsp:include>
	<% }
	%> 

  </body>
</html>
