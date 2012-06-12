<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
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
  	<h1>我的订单</h1>
    <jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
    <%
    	int customerID = currUser.getId();
    	Session se = HibernateSessionFactory.getSession();
		Customerinfo cusInfo = (Customerinfo)se.load(Customerinfo.class, customerID);

		Criteria crit = se.createCriteria(Orderinfo.class);
		crit.add(Restrictions.eq("customerinfo", cusInfo));
		List<Orderinfo> orderinfos = crit.list();
		
		for(Orderinfo info: orderinfos)
		{
			Criteria crit3 = se.createCriteria(Ordercourses.class);
			crit3.add(Restrictions.eq("orderinfo", info));
			List<Ordercourses> odcourses = crit3.list();
			if(info.getState().equals("finish"))
			{
	%>
			
				<table align="center" border="2">
				<tr>
				<td>订单号:<%=info.getOrderId() %></td>
				<td colspan="2">订单生成时间：<%=String.valueOf(info.getOrderTime()) %></td>
				<td>总价格：<%=info.getSumPrice()%></td>
				<!-- <td>状态：<%=info.getState()%></td> -->
				</tr>
				<tr> 
				<td colspan="2">菜肴名</td>
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
						<td colspan="2" align="center"><%=courseinfo.get(0).getName()%></td>
						<td align="center"><%=info2.getNum()%></td>
						<td align="center"><%=courseinfo.get(0).getPrice() %></td>
			<%
					}
			 %>
			 		<tr>
			 			<td align="center" colspan="2">配送地址：<%=info.getAddress()%></td>
						<td align="center" colspan="2">订餐电话：<%=info.getTelephoneNum()%></td>
					</tr>
			<%} %>
			</table>
			
		<%
		}
    	%>
  </body>
</html>
