<%@ page language="java" import="java.util.*"
	import="com.cheating.SessionBean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" media="screen" type="text/css"
	href="css/logo.css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>网上订餐系统</title>
<%--  --%>
</head>

<body>

	<%
		if (request.getSession().getAttribute("orderSuc") != null) {
	%>
	<script>
		alert("预订成功");
	</script>

	<%
		request.getSession().removeAttribute("orderSuc");
		}
	%>


	<div id="wrap">
		<div class="head">
			<div class="logo">
				<a href="index.jsp"><img src="logo5.png" width="126"
					height="100" /> </a>

			</div>
			<div class="welcome">
				<h1>Welcome to</h1>
				<h2>EFC</h2>
				<br />
				<h1>欢迎来到</h1>
				<h2>EFC</h2>
				<h1>网上订餐系统</h1>
			</div>
			<div class="ifLogin">
				<jsp:useBean id="currUser" scope="session"
					class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
				<%
					System.out.println("index.jsp:LoginID:" + currUser.getId());
					if (currUser.getId() == 0) {
				%>
				<jsp:include page="HeadLoggedout.jsp"></jsp:include>
				<%
					} else {
				%>
				<jsp:include page="HeadLoggedin.jsp"></jsp:include>
				<%
					}
				%>
			</div>

		</div>
		<div class="block4">
		<center>
		<a href="showRestaurant.jsp?id=0"><h4>餐馆信息</h4></a>
		</center>
			<jsp:include page="courseMenu.jsp"></jsp:include>

		</div>
		<div class="block3" >
			
			<jsp:include page="Maps.jsp"></jsp:include>
			<jsp:include page="webGL.jsp"></jsp:include>
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
