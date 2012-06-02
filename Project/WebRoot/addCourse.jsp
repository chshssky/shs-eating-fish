<%@ page language="java" import="com.cheating.hib.*" import="org.hibernate.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="fish.man.manager.*" import="java.io.File"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" media="screen" type="text/css" href="css/logo.css"/>
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<html>
  <head>
    <title>manager page</title>
  </head>
  
  <body bgcolor="#FF99CC">

   <%
   		if(request.getAttribute("nullPath") != null)
   		{
   			out.print("<script>alert('"+request.getAttribute("nullPath")+"');</script>") ;
   		}
   		
   		Path.setCurPath(request.getSession().getServletContext().getRealPath("/")) ;
   		System.out.println(request.getSession().getServletContext().getRealPath("/")) ;
   		String curPath = Path.getCurPath() ;
   		String docPath = curPath + "/pictures" ;
   		Path.setDocPath(docPath) ;
   		
		File picDoc = new File(docPath) ;
		if(!picDoc.exists())
		{
			picDoc.mkdir() ;
		}
    %>
    
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
				<jsp:include page="HeadLoggedout.jsp"></jsp:include>   //manager的要换吧？？
				<%
					} else {
				%>
				<jsp:include page="HeadLoggedin.jsp"></jsp:include>
				<%
					}
				%>
	 </div>
	</div>
    
    <form action="uploadPic">
    	<div class="addCourse">
    	<div >请选择菜的类别：</div><div><input type="text" name="courseType">//额。。现在先输入类的ID吧。。.</div><br/>
    	<div>请输入菜名：</div><div><input type="text" name="courseName"></div><br/>
    	<div>请输入菜价：</div><div><input type="text" name="coursePrice"></div><br/>
    	<div>请输入菜的简介：</div><div><input type="text" name="courseDesc"></div><br/>
    	<div>请输入图片路径：</div><div><input type="text" name="picPath"></input></div><br/>
    	<input type="submit" value="上传"></input>
    	</div>
    </form>
    
   	 </div>
	<div id="foot">
  		<center>
    		<h4>版权所(@copy right)</h4>
    	</center>
	</div> 

  </body>
</html>