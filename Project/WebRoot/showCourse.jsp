<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>My JSP 'aaa.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	h1{ font-size: 10px}
	table
	{
		width:100%;
		font-size:15px;
		empty-cells:show;
		border-collapse:collapse;
		margin=0 auto;
		border: 1px solid #cad9ea;
		color:#666;
	}
	th
	{
		background-image: url(C:\Users\Administrator\Desktop\f5caf9a4790a7c724a36d6cd_副本.jpg);
		background-repeat: repeat-x;
		height:30px;
		overflow:hidden;
	}
	<%--td
	{ 
		background:#ff66cc; 
		border-left:10px solid #ff99ff; 
		border-top:3px solid #ff99ff; 
		border-bottom:3px solid #ff33cc; 
		border-right:10px solid #ff33cc;
		}
		--%>
	<%--.bar
	{
		font:12px;   
		background:buttonface;
		color:#000000;
		border:1px solid buttonface;
		cursor:default;   
		behavior:url(img/button.htc)
	}--%>
 
	td
	{
		height:35px;
		
	}
	td,th
	{
		border:2px solid #cad9ea;
		padding:0 lem 0;
	}
	td:nth-child(2)
	{
		width:60%;
	}
	td:nth-child(3)
	{
		width:10%;
	}
	tr:nth-child(even)
	{
		background-color:#f5fafe;
		
	}
	</style>
  </head>
  
  
  <body>

    <%
    	int id =Integer.valueOf(request.getParameter("id"));
    	Session se = HibernateSessionFactory.getSession();
    	Criteria crit = se.createCriteria(Courseinfo.class);
    	if(id != 0)
    	{
    		Criteria crit2 = se.createCriteria(Restaurantinfo.class);
			crit2.add(Restrictions.eq("restaurantId", id));
			List<Restaurantinfo> restinfos = crit2.list();
			
			crit.add(Restrictions.eq("restaurantinfo", restinfos.get(0)));
			
    	}
    	List<Courseinfo> courseinfos = crit.list();
    %>
    <table align="center" border="2">
	<tr>
	<th colspan="4"><h3>菜肴信息</h3></th>
	</tr>
	<tr align="center">
    <td>菜肴名</td>
    <td>菜肴描述</td>
    <td>菜肴价格/元</td>
    <td>填入数量哦</td>
    </tr>
	
	<%
		for(Courseinfo info: courseinfos)
		{
	%>	
			<tr>
			<td align="center"><%=info.getName() %></td>
			<td><%=info.getDescript() %></td>
			<td align="center"><%=info.getPrice() %></td>
			<td align="center">
			<form action="put_cart">
       		<input type="hidden" name="id" id="id" value=<%=info.getCourseId()%>>
       		<input type="text" name="course_count" id="course_count" size="3">
       		<input type="submit" name="submit" value="加入购物车">
       		</form>
       		</td>
			</tr>
		<%
		}
    	%>
    	</table>
  </body>
</html>
