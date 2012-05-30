<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/singleCourse.css"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course</title>
</head>
<body bgcolor="#FFCC66">

<div id="wrap">
	<div class="head">
	  <div class="logo">
	   <a href="index.jsp"><img src="logo5.png" width="126" height="100"/></a>
	  </div>
	  <div class="welcome">
	 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
	  </div>
	  <div class="ifLogin">
				<jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
				<%
					System.out.println("index.jsp:LoginID:" + currUser.getId());
					if(currUser.getId() == 0) {
				%>
				<jsp:include page="HeadLoggedout.jsp"></jsp:include>
				<%
					} else {
				%>
				<jsp:include page="HeadLoggedin.jsp"></jsp:include>
				<%
					}
				%>
	 </div>
	</div>

	<center>
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
		
			<div class="courseName"><%=info.getName() %></div>
			
			<div class="pic">
				~~~此处放图片~~~
			</div>
			<div class="des">
				<%=info.getDescript() %>
			</div>				
			<div class="putCart">
				<h2>仅售</h2><h1><%=info.getPrice() %></h1><h2>元呦,亲~^-^</h2>
				<form action="put_cart">
       				<input type="hidden" name="id" id="id" value=<%=info.getCourseId()%>></input>
       				<input type="text" name="course_count" id="course_count" size="3"></input>
       				<input type="submit" name="submit" value="加入购物车"></input>
       			</form>
       		</div>
		
	 <%
	 		break ;
	 	}
	  %>
	</center>
	
</div>
<div id="foot">
  	<center>
    	<h4>版权所(@copy right)</h4>
    </center>
</div>
	
</body>
</html>