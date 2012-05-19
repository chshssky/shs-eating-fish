<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Menu</title>
</head>
	<body>
		<%
			Session se = HibernateSessionFactory.getSession() ;
    		Criteria critCourse = se.createCriteria(Courseinfo.class) ;
    		Iterator<Courseinfo> courseinfos = critCourse.list().iterator() ;
    		
    		Criteria critType = se.createCriteria(Coursetype.class) ;
    		Iterator<Coursetype> typeinfo = critType.list().iterator() ;
    		while(typeinfo.hasNext())
    		{}
		 %>
		 
	</body>
</html>