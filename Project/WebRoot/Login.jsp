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
   
  <br/><br/><br/><br/><br/>
  		<h1><font color="#9933FF">欢迎登陆</font></h1>
  		<div class="wrapper">
  		<div class="ribbon">欢迎登陆&nbsp&nbsp&nbsp&nbsp<a href="register.jsp"><I>注册</I></a></div>
  		<a href="index.jsp">返回</a>
  		<div class="loginwrapper">
		<s:form action="login_check">
		<s:actionerror/>
			<s:textfield name="loginName" label="用户"></s:textfield><br/>
			<s:password name="password" label="密码"></s:password>
			<s:submit cssStyle="float:left; background:url(login_btn.jpg) 0px 0px;width:92px;height:31px;
 		    border:0px; float:right;margin-right:20px;margin-top:5px;" value=""/>
 		    <s:reset cssStyle="background:url(reset_btn.jpg) 0px 0px;width:92px;height:31px;
 		    border:0px; float:right;margin-right:20px;margin-top:5px;" value="" />
			
		
		</s:form>
		</div>
		<div class="bottomwrapper">
 		<a href="#">忘记密码</a><br/>
 		<a href="#">注册新用</a>
 		</div>
		</div>
		<div class="right">
 		<h1>亲爱的请登录</h1>
 		<p>欢迎来到我们的订餐网</p>
 		<p>希望您订餐过程愉</p>
 		<p>&nbsp &nbsp 全体工作人员寄语</p>
 	</div>
		
  </body>
</html>
