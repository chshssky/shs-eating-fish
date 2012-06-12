<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<link rel="stylesheet" media="screen" type="text/css" href="css/RestaurantDetail.css"/>

<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'seeRestaurant.jsp' starting page</title>
    
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
  	int id = Integer.valueOf(request.getParameter("id"));
  	Session se = HibernateSessionFactory.getSession();
    Criteria crit = se.createCriteria(Restaurantinfo.class);
    crit.add(Restrictions.eq("restaurantId", id));
    List<Restaurantinfo> rest = crit.list();
  %>
  <table>
  <tr>
  <th colspan="2">餐馆信息</th>
  </tr>
  <tr>
  <td>餐馆ID</td>
  <td><%=rest.get(0).getRestaurantId() %></td>
  </tr>
  <tr>
  <td>餐馆名称</td>
  <td><%=rest.get(0).getName() %></td>
  </tr>
  <tr>
  <td>餐馆地址</td>
  <td><%=rest.get(0).getAddress() %></td>
  </tr>
  <tr>
  <td>管理员上限</td>
  <td><%=rest.get(0).getManagerUpBound() %></td>
  </tr>
  </table>
   <%se.close(); %>
  </body>
</html>
