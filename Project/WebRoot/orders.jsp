<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>My JSP 'ShowMyOrder.jsp' starting page</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
	%>
			<table align="center" border="2">
			<tr>
			<td>订单号:<%=info.getOrderId() %></td>
			<td colspan="2">订单生成时间：<%=String.valueOf(info.getOrderTime()) %></td>
			<td>总价格：<%=info.getSumPrice()%></td>
			</tr>
			<tr>
			<td>菜肴名</td>
			<td>数量</td>
			<td>单价</td>
			<td>配送地址</td>
			</tr>
			<%
				for(Ordercourses info2: odcourses)
				{
					Session se3 = HibernateSessionFactory.getSession();
					Criteria crit4 = se3.createCriteria(Courseinfo.class);
					if(info2.getOrderinfo().getState().equals("finish"))
					{
						crit4.add(Restrictions.eq("courseId", info2.getCourseinfo().getCourseId()));
						List<Courseinfo> courseinfo = crit4.list();
					
			%>
						<tr>
						<td align="center"><%=courseinfo.get(0).getName()%></td>
						<td align="center"><%=info2.getNum()%></td>
						<td align="center"><%=courseinfo.get(0).getPrice() %></td>
						<td align="center"><%=info.getAddress()%></td>
						</tr>
			<%
					}
				}
			 %>
			</table>
			
		<%}
    	
     %>
  </body>
</html>
