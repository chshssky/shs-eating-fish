<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link rel="stylesheet" media="screen" type="text/css"
	href="css/showUserInfo.css" />
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
  <body>
		<div id="wrap">
			<div class="head">
				<div class="logo">
					<a href="index.jsp"><img src="logo5.png" width="126"
						height="100" />
					</a>

				</div>
				<div class="welcome">
					<h1>Welcome to</h1>
					<h2>your information</h2>
					<br />
					<h1>欢迎</h1>
					<h2>查看、修�/h2>
					<h1>您的信息</h1>
				</div>
			</div>
			<div class="block4">
				<ul id="navlist">
					<li><a href="showUserInfo.jsp?id=0">我的资料</a>
					</li>
					<li><a href="showUserInfo.jsp?id=1">修改邮箱</a>
					</li>
					<li><a href="showUserInfo.jsp?id=2">修改密码</a>
					</li>
					<li><a href="index.jsp">返回</a>
					</li>
				</ul>

			</div>
			<div class="block3">
				<%
					int id = Integer.valueOf(request.getParameter("id"));
				%>
				<jsp:include page="userInfo.jsp"><jsp:param
						name="param" value="<%=id%>"></jsp:param>
				</jsp:include>
			</div>

		</div>
		<div id="foot">
			<center>
				<h4>版权所�@all rights reserved) eating; chshs ; fish</h4>
				<h4>Any question please call 18801791172</h4>
			</center>
		</div>
	</body>
</html>
