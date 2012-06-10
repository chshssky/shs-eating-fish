<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" media="screen" type="text/css" href="css/showUserInfo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUserInfo.jsp' starting page</title>
    
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
  	int id =Integer.valueOf(request.getParameter("id"));
   %>
    <div class="userInfoGuide">
    <table>
    <tr>
    <td><a href="showUserInfo.jsp?id=0">我的资料</a></td>
    </tr>
    <tr>
    <td><a href="showUserInfo.jsp?id=1">修改邮箱</a></td>
    </tr>
    <tr>
    <td><a href="showUserInfo.jsp?id=2">修改密码</a></td>
    </tr>
    </table>
    </div>
    <div class="change">
    <jsp:include page="userInfo.jsp"><jsp:param name="param" value="<%=id%>"></jsp:param>
    </jsp:include>
    </div>
  </body>
</html>
