<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'aaa.jsp' starting page</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	<td colspan="3"><h3>菜肴信息</h3></td>
	</tr>
	<tr align="center">
    <td>菜肴名</td>
    <td>菜肴描述</td>
    <td>菜肴价格/元</td>
    </tr>
	
	<%
		for(Courseinfo info: courseinfos)
		{
	%>
			<tr>
			<td><%=info.getName() %></td>
			<td><%=info.getDescript() %></td>
			<td><%=info.getPrice() %></td>
			<td align="center">
			<form>
       		<input type="hidden" name="id" id="id" value=<%=info.getCourseId()%>>
       		<input type="text" name=course_count id="course_count" size="3">
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
