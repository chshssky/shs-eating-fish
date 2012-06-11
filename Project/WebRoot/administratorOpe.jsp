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
  	int id;
  	if(request.getParameter("id")==null)
  		id = -1;
  	else
  		id =Integer.valueOf(request.getParameter("id"));
   %>
    <div class="userInfoGuide">
    <table>
    <tr>
    <td><a href="administratorOpe.jsp?id=-1">查看所有管理员</a></td>
    </tr>
    <tr>
    <td><a href="administratorOpe.jsp?id=-2">增加管理员</a></td>
    </tr>
    <tr>
    <td><a href="administratorOpe.jsp?id=-3">删除管理员</a></td>
    </tr>
    </table>
    </div>
    <div class="change">
    <%	if(id == -1)
    {
     %>
    <jsp:include page="checkAllManagers.jsp"></jsp:include>
    <%
    }
    else if(id == -2)
    {
     %>
     <jsp:include page="addManager.jsp"></jsp:include>
    <%
    }
    else if(id == -3)
    {%>
    <jsp:include page="deleteManagerB.jsp"><jsp:param name="id" value="-1"></jsp:param></jsp:include>
    <%}
    else if(id == 0)
    {%>
    	<jsp:include page="deleteManagerB.jsp"><jsp:param name="id" value="0"></jsp:param></jsp:include>
    <%}
    else
    {
     %>
      <jsp:include page="deleteManagerB.jsp"><jsp:param name="id" value="<%=id%>"></jsp:param></jsp:include>
    <%
    }
     %>
    </div>
  </body>
</html>
