<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<html>
	<head>
		<title>Manager Page</title>
	</head>
	<body bgcolor="#FFCC66">
		<% 
			if(request.getAttribute("rmvSuc") != null)
	   		{
	   			out.print("<script>alert('"+request.getAttribute("rmvSuc")+"');</script>") ;
	   		}
   			request.getSession().removeAttribute("rmvSuc") ;
		
			int restId = (Integer)request.getSession().getAttribute("restId") ; 
			Session se = HibernateSessionFactory.getSession() ;
			Restaurantinfo curRest = (Restaurantinfo)se.load(Restaurantinfo.class, restId) ;
			Criteria courseList = se.createCriteria(Courseinfo.class) ;
			courseList.add(Restrictions.eq("restaurantinfo", curRest));
			Iterator<Courseinfo> courseIt = courseList.list().iterator() ;
		 %>
		<div id="wrap">
		<div class="head">
		  <div class="logo">
		   <img src="logo5.png" width="126" height="100"/>
		  </div>
		  <div class="welcome">
		 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
		 	<h2> &nbsp &nbsp &nbsp Manager Page&nbsp &nbsp &nbsp
		 	<a href="index.jsp">登出</a></h2>
		 </div>
		 </div>
	
		<div>
			<div class="funcMenu">
				<a href="addCourse.jsp">添加新菜</a><br/><br/>
				<a href="managerinfo.jsp">修改个人资料</a><br/><br/>
				<a href="manOrder.jsp">查看当前订单</a><br/><br/>
			</div>
			
			
			<div class="infoName">
				<h1>饭店信息</h1>
			
				<div class="info">
					<h2><%=curRest.getDescript() %></h2>
					
    				<input type="button" value="修改" onclick="window.location='modifyRest.jsp'"/>
				</div>
			</div>
			
			<div class="cinfoName">
				<h1>菜品信息</h1>
			
				<div class="cinfo">
				
				<%
					while(courseIt.hasNext())
					{
						Courseinfo curCourse = courseIt.next() ;
				 %>	
				 		<form action="modifyCourse">
				 		<div class="modifyButton">
							<h2><%=curCourse.getName() %></h2>
						</div>
						<div class="modifyButton2">
							<input type="hidden" name="courseID" value=<%=curCourse.getCourseId() %> />
							&nbsp &nbsp<input type="submit" value="修改" />
    					</div>
    					</form>
    					
    					<form action="rmvCourse">
						<div class="modifyButton2">
							<input type="hidden" name="courseID" value=<%=curCourse.getCourseId() %> />
							&nbsp &nbsp<input type="submit" value="删除" />
    					</div>
    					</form>
    				
				<%
					}
				 %>
				 
				</div>
			</div>
			
		</div>
		
		
	</div>
	<div id="foot">
  		<center>
    		<h4>版权所�@copy right)</h4>
    	</center>
	</div> 
	</body>
</html>