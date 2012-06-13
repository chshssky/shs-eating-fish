<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/LoginCss.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    <meat http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	
  </head>
 
  
  <body>
  
  <%
  		if(request.getAttribute("needLogin") != null)
  		{
 %>
  			<script>
				alert("请先登录") ; 
			</script>
  <%
		request.removeAttribute("needLogin") ;
		}
   %>
   
<center>
  <div class="login">
  <fieldset>
  <legend><h1><font color="#9933FF">欢迎登陆</font></h1></legend>
  		<s:form action="login_check">
		<s:actionerror/>
			<s:textfield name="loginName" label="用户"></s:textfield><br/>
			<s:password name="password" label="密码"></s:password>
			<s:submit  value="登录"/>
 		    <s:reset value="重置" />
		</s:form>
		<a href="index.jsp">返回</a>
   </fieldset>
   </div>
   </center>
  </body>
</html>
