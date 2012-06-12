<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" media="screen" type="text/css" href="css/adminOpe.css"/>
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
<script type="text/javascript">
function showCustomer(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","seeRestaurant.jsp",true);
xmlhttp.send();
}
</script>
  </head>
  
  <body>
 <div id="wrap">
 <div id="main" class="clearfix">
  <div class="head">
  <div class="welcome">
 <h1>Welcome to</h1><h2>Administrator</h2><br/><h1>欢迎来到</h1><h2>Administrator</h2><h1>页面</h1>
  </div>
    </div>
     <div class="block4">
		<%
  	int id;
  	if(request.getParameter("id")==null)
  		id = -1;
  	else
  		id =Integer.valueOf(request.getParameter("id"));
   %>
    <ul id="navlist">
    <li><a href="administratorOpe.jsp?id=-1">查看所有管理员</a></li>
    <li><a href="administratorOpe.jsp?id=-2">增加管理员</a></li>
    <li><a href="administratorOpe.jsp?id=-3">删除管理员</a></li>
    <li><a>退出</a></li>
    </ul>

		
	 </div>
     <div class="block3">
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
	<div id="txtHint" cssStyle="float=left">客户信息将在此处列出 ...</div>
  	</div>
  	</div>


  <div id="foot">
  	<center>
    <h4>版权所有(@all rights reserved) eating; chshs ; fish</h4>
    <h4>Any question please call 18801791172</h4>
    </center>
  </div>
 </body>
</html>
