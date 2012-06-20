<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Search</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<sx:head/>
  </head>
  
  <body>
    Search:
    <s:form action="autocompletertag">
    <select name="option">
    	<option value="rest">餐馆</option>
    	<option value="cour">菜品</option>
    </select>
    
    
	<sx:autocompleter label="搜索" list="courses" searchType="substring" name="myCourse" ></sx:autocompleter> 
	<s:submit name="submit"></s:submit>
	</s:form>
  </body>
</html>
