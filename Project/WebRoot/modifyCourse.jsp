<%@ page language="java" pageEncoding="UTF-8"
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
import="java.util.*"%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Modify Course</title>
</head>

<body>
<div id="wrap">
		<div class="head">
		  <div class="logo">
		   <img src="logo5.png" width="126" height="100"/>
		  </div>
		  <div class="welcome">
		 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
	 	<h2> &nbsp &nbsp &nbsp &nbsp  &nbsp  &nbsp &nbsp &nbsp Manager Page</h2>
	 	&nbsp &nbsp &nbsp <a href="manager.jsp">return</a>
		 </div>
		 </div>
	
	<%
		Session se = HibernateSessionFactory.getSession() ;
		int courseId =Integer.valueOf(request.getParameter("courseID")) ;
		Criteria critCourse = se.createCriteria(Courseinfo.class) ;
		critCourse.add(Restrictions.eq("courseId", courseId)) ;
    	Iterator<Courseinfo> courseinfos = critCourse.list().iterator() ;
    	Courseinfo info = courseinfos.next() ; 
		request.getSession().setAttribute("if_modify", "y") ;
		
		Criteria cri = se.createCriteria(Coursetype.class) ;
   		Iterator<Coursetype> typeit = cri.list().iterator() ;
	%>	
	
		<div class="modifyCourse">
			<s:form action="modifyOp">
			<div>
				<h1>名称：</h1>
				<input type="text" value=<%=info.getName() %> name="modifyName" class="input2" />
				<h1>类别：</h1>
    			<select name="modifyType" class="input2"> //显示当前的类别
	    			<%
	    				while(typeit.hasNext()) 
	    				{
	    					Coursetype curType = typeit.next() ;
	    					
	    			%>
	    					<option value=<%=curType.getId()%>><%=curType.getTypeName() %></option>	
	    			<%	} %>
	    		</select>
    		</div><br>
			
			<div>
				<h1>售价：</h1><input type="text" value=<%=info.getPrice() %> name="modifyPrice" class="input2" />
       		</div>
			
			<div class="pic">
				<h1>图片：</h1><img src=<%=info.getPic() %> height="100px" width="100px"/><br> 
			 	<h1>修改图片请输入图片路径：</h1><input type="text" value="" name="modifyPic" size="30px" class="input2" />
			</div><br>
			
			<div class="des">
				<h1>简介：</h1><input type="text" value=<%=info.getDescript() %> name="modifyDesc" class="input" />
			</div><br>
			
       				<input type="hidden" name="courseID" value=<%=info.getCourseId()%>></input>
       				<input type="submit" name="submit" value="修改" class="input2"></input>
       		</s:form>
       	</div>
</div>
<div id="foot">
  	<center>
    	<h4>版权所有(@copy right)</h4>
    </center>
</div>
</body>
</html>