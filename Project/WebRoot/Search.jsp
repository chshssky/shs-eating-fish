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

	<br>test<sx:datetimepicker name="fromDate"/> 
<br>test2:<sx:datetimepicker name="birthday" value="%{date}" displayFormat="yy-MM-dd" /> 
<br>test3:<sx:datetimepicker name="student.birthday" type="date" displayFormat=""yyyy-MM-dd HH:mm:ss"" label="生日" value="%{date}"/>
      <sx:autocompleter name="search"  searchType="substring" list="{'上海哈哈哈','上海','上海哈哈哈你','上海么','你好'}">
    </sx:autocompleter>
<sx:autocompleter list="provice" name="provice"></sx:autocompleter> 
  
  </body>
</html>
