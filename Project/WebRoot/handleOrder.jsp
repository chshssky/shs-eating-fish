<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
<html>
  <head>  
    <title>Continue Pay</title>   
  </head>
  
  <body topmargin="100">
    <jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
    <%
    	int customerID = currUser.getId();
    	Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Customerinfo.class);
		crit.add(Restrictions.eq("customerId", customerID));
		List<Customerinfo> cusinfos = crit.list();
		Criteria crit2 = se.createCriteria(Orderinfo.class);
		crit2.add(Restrictions.eq("customerinfo", cusinfos.get(0)));
		List<Orderinfo> orderinfos = crit2.list();
		
		for(Orderinfo info: orderinfos)
		{
			Session se2 = HibernateSessionFactory.getSession();
			Criteria crit3 = se2.createCriteria(Ordercourses.class);
			crit3.add(Restrictions.eq("orderinfo", info));
			List<Ordercourses> odcourses = crit3.list();
			if(info.getState().equals("dealing"))
			{
	%>
			
				<table align="center" border="2">
				<tr>
				<td>订单号:<%=info.getOrderId() %></td>
				<td colspan="2">订单生成时间：<%=String.valueOf(info.getOrderTime()) %></td>
				
				</tr>
				<tr>
				<td>菜肴名</td>
				<td>数量</td>
				<td>单价</td>
				</tr>
				<%
					for(Ordercourses info2: odcourses)
					{
						Session se3 = HibernateSessionFactory.getSession();
						Criteria crit4 = se3.createCriteria(Courseinfo.class);
						crit4.add(Restrictions.eq("courseId", info2.getCourseinfo().getCourseId()));
						List<Courseinfo> courseinfo = crit4.list();
						
				%>
						<tr>
						<td align="center"><%=courseinfo.get(0).getName()%></td>
						<td align="center"><%=info2.getNum()%></td>
						<td align="center"><%=courseinfo.get(0).getPrice() %></td>
						</tr>
						
			<%
					}
			 %>
			 	<tr><td><td>总价格：<%=info.getSumPrice()%></td><td/></tr>
			</table>
			<form action="conOrder">
				<input type="hidden" name="curOrderId" value=<%=info.getOrderId() %> />
				<input type="submit" value="确认订单" /> 		
			</form>
			
	<%	
			}
		}
     %>
  </body>
</html>
