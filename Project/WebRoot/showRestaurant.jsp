<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body topmargin="100" >
    <table>
    <tr><td>��������ĸ�����Ĳ����أ�</td></tr>
    <tr><td><a href="showCourse.jsp?id=0" target="right" >ȫ�����</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=1" target="right">�̷纫���տ� ��ǳ���</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=2" target="right">���̷� ��ǳ���</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=3" target="right">��һ��</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=4" target="right">��ԣ�ɵ��� ��һ�ǵ�</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=5" target="right">�۾�̨</a></td></tr>
    <tr><td><a href="showCourse.jsp?id=6" target="right">������ ���ŵ�</a></td></tr>
    </table>
  </body>
</html>
