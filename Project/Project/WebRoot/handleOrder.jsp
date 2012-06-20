<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>

<link rel="stylesheet" media="screen" type="text/css" href="css/handleOrder.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>  
    <title>Continue Pay</title>   
  </head>
  
  <body>
  <jsp:useBean id="currUser" scope="session" class="com.cheating.SessionBean.LoginedUser"></jsp:useBean>
  <div id="wrap">
  <div class="head">
  <div class="logo">
   <a href="index.jsp"><img src="logo5.png" width="126" height="100"/></a>
 
  </div>
  <div class="welcome">
 <h1>Welcome to</h1><h2>check</h2><br/><h1>欢迎查看</h1><h2>未提交的</h2><h1>订单</h1>
  </div>
  <div class="ifLogin">
			<%
				System.out.println("index.jsp:LoginID:" + currUser.getId());
				if(currUser.getId() == 0) {
			%>
			<jsp:include page="HeadLoggedout.jsp"></jsp:include>
			<%
				} else {
			%>
			<jsp:include page="HeadLoggedin.jsp"></jsp:include>
			<%
				}
			%>   
	</div>
  </div>
     <div class="block4">
		
		
	 </div>
     <div class="block3">
    	 
    <%
    	int customerID = currUser.getId();
    	Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Customerinfo.class);
		crit.add(Restrictions.eq("customerId", customerID));
		List<Customerinfo> cusinfos = crit.list();
		Criteria crit2 = se.createCriteria(Orderinfo.class);
		crit2.add(Restrictions.eq("customerinfo", cusinfos.get(0)));
		List<Orderinfo> orderinfos = crit2.list();
		int count1 = 0;
		int count2 = 0;
		for(Orderinfo info: orderinfos)
		{
			count1 = count1+1;
			Session se2 = HibernateSessionFactory.getSession();
			Criteria crit3 = se2.createCriteria(Ordercourses.class);
			crit3.add(Restrictions.eq("orderinfo", info));
			List<Ordercourses> odcourses = crit3.list();
			if(info.getState().equals("未提交"))
			{
				count2 = count2 + 1;
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
			 	<tr><td colspan="3">总价格：<%=info.getSumPrice()%></td></tr>
			</table>
		<div class="handleSub">
			<form action="conOrder">
				<input type="hidden" name="curOrderId" value=<%=info.getOrderId() %> />
				<input type="submit" class="input2" value="确认订单" /> 		
			</form>
		</div>
	<%	}
			
		}
		if(count2 == 0)
		{
     %>
     <center>
     <h1><font face="华文行楷">您目前还没有未提交的订单哦</font></h1>
     </center>
     <%} %>
     </div>
	 
  	</div>
  	
  
  
  
  
  
  
  
   
  </body>
</html>
