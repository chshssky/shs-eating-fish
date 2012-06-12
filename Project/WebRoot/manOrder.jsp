<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*" import="fish.man.manager.RestOrder"
import="fish.man.manager.SingleOrder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<html>
<head>
<title>Check Order</title>
</head>
	<body>
		 <% 
  		if(request.getSession().getAttribute("rmvSuc") != null) 
   		{ 
   		%>
   			<script>
   				alert("删除成功") ;
   			</script>
   			
   		<%
   			request.getSession().removeAttribute("rmvSuc") ;
   		}
   	
			int restId = (Integer)request.getSession().getAttribute("restId") ;
			int listIndex = 0 ;
			RestOrder.searchOrder(restId) ;
			
			Iterator<SingleOrder> orderlist = RestOrder.getRestList().iterator() ;
			SingleOrder curOrder ;
			for(; orderlist.hasNext(); ++ listIndex)
			{
				curOrder = orderlist.next() ;
		%>
	<div class="rmvOrder">	
			<table align="center" border="2">
				<tr>
				<td>订单号:<%=curOrder.getOrder().getOrderId() %></td>
				<td colspan="2">订单生成时间：<%=String.valueOf(curOrder.getOrder().getOrderTime()) %></td>
				<td>总价格：<%=curOrder.getOrder().getSumPrice()%></td>
				<td>状态：<%=curOrder.getOrder().getState()%></td>
				
				</tr>
				
					<tr>
						<td align="center">用户名：<%=curOrder.getOrder().getCustomerinfo().getLogininfo().getLoginName() %></td> 					
			 			<td align="center" colspan="2">配送地址：<%=curOrder.getOrder().getAddress()%></td>
						<td align="center" colspan="2">订餐电话：<%=curOrder.getOrder().getTelephoneNum()%></td>
					</tr>
			</table>
			</div>
				
			<div class="rmvOrderButton">
				<input type="button" class="input2" value="查看详情" onclick="window.location='orderDetail.jsp?id=<%=listIndex %>'" />
			</div>	
				
			<div class="rmvOrderButton">
				<form action="manOrderRmv">	
					<input type="hidden" name="listIndex" value=<%=listIndex %> />
					<input type="hidden" name="curOrderId" value=<%=curOrder.getOrder().getOrderId() %> />
					<input type="submit" value="删除" class="input2" />
				</form>
			</div>
			
			<%
				}
			 %>
				
	</body>
	
</html>