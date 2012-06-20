<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*" import="fish.man.manager.RestOrder"
import="fish.man.manager.SingleOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<table align="center" border="2">
			<tr> 
				<td colspan="3">菜肴名</td>
				<td>数量</td>
				<td>单价</td>
			</tr>
				<%
					int listIndex = Integer.valueOf(request.getParameter("id"));
					SingleOrder curOrder = RestOrder.getRestList().get(listIndex) ;
					
					Iterator<Courseinfo> singleCourse = curOrder.getCourses().iterator() ;
					Iterator<Integer> numlist = curOrder.getNum().iterator() ;
					while(singleCourse.hasNext())
					{
						Courseinfo curCourse = singleCourse.next() ;
						int curNum = numlist.next() ;
						
				%>
					<tr>
						<td colspan="3" align="center"><%=curCourse.getName()%></td>
						<td align="center"><%=curNum%></td>
						<td align="center"><%=curCourse.getPrice() %></td>
					</tr>
			<%
					}
			%>
		</table>
</body>
</html>