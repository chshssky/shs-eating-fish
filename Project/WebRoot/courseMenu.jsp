<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
    		
    		
    		Criteria critType = se.createCriteria(Coursetype.class) ;
    		Iterator<Coursetype> typeinfo = critType.list().iterator() ;
    		while(typeinfo.hasNext())
    		{
    			Coursetype type = typeinfo.next() ;
		 %>
		 	<table>
		 	<tr>
		 	<td>
		 		<%=type.getTypeName()%>
		 	</td>
		 	</tr>
		 	</table>
		 <%		//critCourse.add(Restrictions.eq("type", type.getId())) ;
    			Iterator<Courseinfo> courseinfos = critCourse.list().iterator() ;
		 		while(courseinfos.hasNext())
		 		{
		 			Courseinfo course = courseinfos.next() ;
		 			if(course.getCoursetype().getId() != type.getId())
		 				continue ;
		 			
		 %>
		 		<form action="singleCourse.jsp">
		 			<table>
		 			<tr>
		 				<td><a href="singleCourse.jsp?id=<%=course.getCourseId()%>"><%=course.getName()%></a></td>
		 			</tr>
		 			</table>
		 		</form>
		 <%
		 		}
		 	}
		  %>
		 
		 
	</body>
</html>