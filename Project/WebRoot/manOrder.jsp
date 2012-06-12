<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*" import="fish.man.manager.RestOrder"
import="fish.man.manager.SingleOrder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Check Order</title>
</head>
	<body>
		<%
			int restId = (Integer)request.getSession().getAttribute("restId") ;
			RestOrder.searchOrder(restId) ;
			//System.out.println(RestOrder.getRestList().size()) ;
			
			Iterator<SingleOrder> orderlist = RestOrder.getRestList().iterator() ;
			while(orderlist.hasNext())
			{
				SingleOrder curOrder = orderlist.next() ;
				//System.out.println("test" + curOrder.getOrder().getOrderId()) ;
		%>
		
			<table align="center" border="2">
				<tr>
				<td>订单号:<%=curOrder.getOrder().getOrderId() %></td>
				<td colspan="2">订单生成时间：<%=String.valueOf(curOrder.getOrder().getOrderTime()) %></td>
				<td>总价格：<%=curOrder.getOrder().getSumPrice()%></td>
				<!-- <td>状态：<%=curOrder.getOrder().getState()%></td> -->
				<td></td>
				</tr>
				<tr> 
				<td colspan="2">菜肴名</td>
				<td>数量</td>
				<td>单价</td>
				</tr>
				<%
					Iterator<Courseinfo> singleCourse = curOrder.getCourses().iterator() ;
					Iterator<Integer> numlist = curOrder.getNum().iterator() ;
					while(singleCourse.hasNext())
					{
						Courseinfo curCourse = singleCourse.next() ;
						int curNum = numlist.next() ;
						
				%>
						<tr>
						<td colspan="2" align="center"><%=curCourse.getName()%></td>
						<td align="center"><%=curNum%></td>
						<td align="center"><%=curCourse.getPrice() %></td>
						</tr>
			<%
					}
			%>
					<tr>
			 			<td align="center" colspan="2">配送地址：<%=curOrder.getOrder().getAddress()%></td>
						<td align="center" colspan="2">订餐电话：<%=curOrder.getOrder().getTelephoneNum()%></td>
					</tr>
			
			<%
				}
			 %>
			</table>	
	</body>
	
</html>