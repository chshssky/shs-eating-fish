<%@ page language="java" import="com.cheating.hib.*" import="org.hibernate.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="fish.man.manager.*" import="java.io.File"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>manager page</title>
  </head>
  
  <body>

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
    
    <form action="uploadPic">
    	请选择菜的类别：<input type="text" name="courseType">//额。。现在先输入类的ID吧。。。<br/> 
    	请输入菜名：<input type="text" name="courseName"><br/>
    	请输入菜价：<input type="text" name="coursePrice"><br/>
    	请输入菜的简介：<input type="text" name="courseDesc"><br/>
    	请输入图片路径：<input type="text" name="picPath"></input><br/>
    	<input type="submit" value="上传"></input>
    </form>
    

  </body>
</html>