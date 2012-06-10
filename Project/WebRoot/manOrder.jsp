<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Check Order</title>
</head>
	<body>
		<%
			Session se = HibernateSessionFactory.getSession() ;
			int restId = (Integer)request.getSession().getAttribute("restId") ;
			Criteria orderList = se.createCriteria(Orderinfo.class) ;
			orderList.add(Restrictions.eq("state", "finish"));
		%>
	</body>
</html>