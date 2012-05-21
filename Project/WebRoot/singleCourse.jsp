<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" 
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
<title>Insert title here</title>
</head>
<body>
	<%
		Session se = HibernateSessionFactory.getSession() ;
		int courseId =Integer.valueOf(request.getParameter("id")) ;
		Criteria critCourse = se.createCriteria(Courseinfo.class) ;
		//critCourse.add(Restrictions.eq("CourseId", courseId)) ;
    	Iterator<Courseinfo> courseinfos = critCourse.list().iterator() ;
    	
		while(courseinfos.hasNext())
		{
			Courseinfo info = courseinfos.next() ;
			if(info.getCourseId() != courseId)
				continue ;
	%>	
		<table>
			<tr>
				<td><%=info.getName() %></td>
			</tr>
			<tr>
				<td><%=info.getDescript() %></td>
			</tr>
			<tr>
			<td>仅售<%=info.getPrice() %>元呦~亲~</td>
			</tr>
		
			<tr>
			<td>
			<form action="put_cart">
       		<input type="hidden" name="id" id="id" value=<%=info.getCourseId()%>></input>
       		<input type="text" name="course_count" id="course_count" size="3"></input>
       		<input type="submit" name="submit" value="加入购物车"></input>
       		</form>
       		</td>
       		</tr>
		</table>
		
	 <%
	 		break ;
	 	}
	  %>
	 
</body>
</html>