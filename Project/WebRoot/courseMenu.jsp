<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/courseMenu.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Menu</title>
</head>
	<body>
	<div class="accordion">
		<h2>菜肴汇总</h2>
		<%
			Session se = HibernateSessionFactory.getSession() ;
    		Criteria critCourse = se.createCriteria(Courseinfo.class) ;  		
    		Criteria critType = se.createCriteria(Coursetype.class) ;
    		Iterator<Coursetype> typeinfo = critType.list().iterator() ;
    		while(typeinfo.hasNext())
    		{
    			
    			Coursetype type = typeinfo.next() ;
    			String idi = type.getTypeName();
    			String idii = "#" + type.getTypeName();
		 %>
		 	<%-- <table>
		 	<tr>
		 	<td>--%>
		 	<div id=<%=idi%> class="section">
		 		<h3><a href=<%=idii%>><%=type.getTypeName()%></a></h3>
		 <%--	</td>
		 	</tr>
		 	</table> --%>
		 	<div>
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
		 		%>
		 		</div>
		 		</div>
		 	<% }
		  %>
		  </div>
		 
		 
	</body>
</html>