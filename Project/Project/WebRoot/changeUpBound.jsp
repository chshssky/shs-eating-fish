<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changeUpBound.jsp' starting page</title>
    
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
  <table>
  <tr>
  <th>餐馆名</th>
  <th>管理员上限</th>
  </tr>
  <%
    Session se = HibernateSessionFactory.getSession();
	Criteria crit2 = se.createCriteria(Restaurantinfo.class);
	List<Restaurantinfo> restinfos = crit2.list();
	for(Restaurantinfo info:restinfos)
	{
	%>
		<tr>
		<td><%=info.getName() %></td>
		<td><%=info.getManagerUpBound() %></td>
		<td>
		<form action="changeUpBound">
       		<input type="hidden" name="id" value=<%=info.getRestaurantId()%>></input>
       		<input type="text" name="newUpBound" size="3"></input>
       		<input type="submit" name="submit" value="确认修改"></input>
       	</form>
       	</td>
		</tr>
	<%
	}
     %>
     </table>
  </body>
</html>
