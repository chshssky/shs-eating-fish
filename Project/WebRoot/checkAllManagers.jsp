<%@ page language="java" import="java.util.*"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkAllManagers.jsp' starting page</title>
    
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
     <td>管理员ID</td>
     <td>管理员名称</td>
     <td>管理员所属餐馆</td>
     <td>操作</td>
     </tr>
    <%
    	Session se = HibernateSessionFactory.getSession();
    	Criteria crit = se.createCriteria(Managerinfo.class);
    	
    	List<Managerinfo> managerinfos = crit.list();
    	for(Managerinfo info:managerinfos)
    	{
    		int restaurantID = info.getRestaurantinfo().getRestaurantId();
    		System.out.println(restaurantID);
    		Criteria crit2 = se.createCriteria(Restaurantinfo.class);
    		crit2.add(Restrictions.eq("restaurantId", restaurantID));
    		List<Restaurantinfo> restinfos = crit2.list();
    		String restaurantName = restinfos.get(0).getName();
    		System.out.println(restaurantName);
    		
     %>
     <tr>
     <td><%=info.getManagerId() %></td>
     <td><%=info.getName() %></td>
     <td><%=restaurantName %></td>
     <td>
     <form action="deleteManagerA">
     <input type="hidden" name="managerID" value=<%=info.getManagerId()%>></input>
     <input type="hidden" name="loginID" value=<%=info.getLogininfo().getLoginId() %>></input>
     <input type="submit" value="删除此管理员"></input>
     </form>
     </td>
     </tr>
    
     
     <%
     	}
     	se.close();
     	
      %>
   </table>
  </body>
</html>
