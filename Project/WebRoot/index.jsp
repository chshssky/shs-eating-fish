<%@ page language="java" import="java.util.*" import="com.cheating.SessionBean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>网上订餐系统</title>
	
  </head>
  
  <body bgcolor="#CCCCFF">
  <div id="wrap">
  <div id="main">
  <div class="head">
  <h1>welcome to EFC&nbsp;&nbsp;&nbsp;欢迎来到EFC网上订餐系统</h1>
  <div class="block2">
  <jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
  	<%
  		System.out.println("index.jsp:LoginID:" + currUser.getId());
  		if(currUser.getId() == 0) {
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
      <div class="block3">
    
     <a href="RestaurantInfoMenu.jsp?id=0">餐馆信息</a>

     </div>
  
  </div>
  </div>
    </div>
  <div id="foot">
  <center>
     <h4>版权所有(copy right)</h4>
     </center>
  </div>
	
  </body>
</html>
