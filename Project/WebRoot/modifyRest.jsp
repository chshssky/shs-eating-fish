<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modify Restaurant Infomation</title>
</head>
<body>
	<%
		
		int restId = (Integer)request.getSession().getAttribute("restId") ; 
		Session se = HibernateSessionFactory.getSession() ;
		Restaurantinfo curRest = (Restaurantinfo)se.load(Restaurantinfo.class, restId) ;
	 %>
	 
	 <textArea name="restInfo" cols="50" rows="8"><%=curRest.getDescript() %></textArea>
</body>
</html>