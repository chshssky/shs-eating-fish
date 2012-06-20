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

<link rel="stylesheet" media="screen" type="text/css" href="css/checkAllManagers.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
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
  <div class="eachManager">
  <table>
   	 <tr>
     <th><h1>管理员ID</h1></th>
     <th><h1>管理员名称</h1></th>
     <th><h1>管理员所属餐馆</h1></th>
     <th><h1>操作</h1></th>
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
   </div>
  </body>
</html>
