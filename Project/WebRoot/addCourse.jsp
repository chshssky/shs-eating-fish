<%@ page language="java" import="com.cheating.hib.*" import="org.hibernate.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="fish.man.manager.*" import="java.io.File"
import="org.hibernate.Criteria" import="org.hibernate.criterion.Restrictions"%>

<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<html>
  <head>
    <title>manager page</title>
  </head>
  
  <body bgcolor="#FFCC66">

   <%
   		if(request.getAttribute("nullPath") != null)
   		{
   			out.print("<script>alert('"+request.getAttribute("nullPath")+"');</script>") ;
   		}
   		
   		Path.setCurPath(request.getSession().getServletContext().getRealPath("/")) ;
   		Session se = HibernateSessionFactory.getSession() ;
   		System.out.println(request.getSession().getServletContext().getRealPath("/")) ;
   		String curPath = Path.getCurPath() ;
   		String docPath = curPath + "/pictures" ;
   		Path.setDocPath(docPath) ;
   		
   		Criteria cri = se.createCriteria(Coursetype.class) ;
   		Iterator<Coursetype> typeit = cri.list().iterator() ;
   		
		File picDoc = new File(docPath) ;
		if(!picDoc.exists())
		{
			picDoc.mkdir() ;
		}
    %>
    
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
    
    <s:form action="uploadPic">
    	<div class="addCourse">
    	<!-- <div >请选择菜的类别：</div><div><input type="text" name="courseType">//额。。现在先输入类的ID吧。。.</div><br/> -->
    	<div>请选择菜的类别：
    		<select name="courseType">
    			<%
    				while(typeit.hasNext()) 
    				{
    					Coursetype curType = typeit.next() ;
    					
    			%>
    					<option value=<%=curType.getId()%>><%=curType.getTypeName() %></option>	
    			<%	} %>
    		</select>
    	</div><br>
    	<div>请输入菜名：</div><div><input type="text" name="courseName"></div><br/>   	
    	<div>请输入菜价：</div><div><input type="text" name="coursePrice"></div><br/>
    	<div>请输入图片路径：</div><div><input type="text" name="picPath"></input></div><br/>
    	<div>请输入菜的简介：</div>
    	<div><textarea name="courseDesc" cols="50" rows="8"></textarea></div><br/>   	
    	<input type="submit" value="上传"></input>
    	</div>
    </s:form>
    
   	</div>
	<div id="foot">
  		<center>
    		<h4>版权所有(@copy right)</h4>
    	</center>
	</div> 

  </body>
</html>