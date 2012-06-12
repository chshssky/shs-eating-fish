<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*" import="fish.man.manager.RestOrder"
import="fish.man.manager.SingleOrder" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<link rel="stylesheet" media="screen" type="text/css" href="css/manager.css"/>

<html xmls="http://www.w3.org/1999/xhtml">
<head>
<title>Check Order</title>
<style type="text/css">
.block3
{
	width:50%;
}
	h1{ font-size: 10px}
	table
	{
		width:50%;
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
	<body bgcolor="#FFCC66">
	<div id="wrap">
	<div class="head">
	  <div class="logo">
	   <img src="logo5.png" width="126" height="100"/>
	  </div>
	  <div class="welcome">
	 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
	 	<h2> &nbsp &nbsp &nbsp &nbsp  &nbsp  &nbsp &nbsp &nbsp Manager Page</h2>
	 	&nbsp &nbsp &nbsp <a href="manager.jsp">return</a>
	 </div>
	 </div>
	
		 <% 
  		if(request.getSession().getAttribute("rmvSuc") != null) 
   		{ 
   		%>
   			<script>
   				alert("删除成功") ;
   			</script>
   		<div class="block3">	
   		<%
   			request.getSession().removeAttribute("rmvSuc") ;
   		}
   			int sign;
   			if(request.getParameter("id") == null)
   				sign=0;
   			else
   				sign = Integer.valueOf(request.getParameter("id"));
   		    System.out.println("?????????" + sign);
			int restId = (Integer)request.getSession().getAttribute("restId") ;
			int listIndex = 0 ;
			RestOrder.searchOrder(restId) ;
			
			Iterator<SingleOrder> orderlist = RestOrder.getRestList().iterator() ;
			SingleOrder curOrder ;
			for(; orderlist.hasNext(); ++ listIndex)
			{
				curOrder = orderlist.next() ;
		%>
		
			<table border="2">
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
					<tr>
					<td colspa ="2"><input type="button" class="input2" value="查看详情" onclick="window.location='manOrder.jsp?id=<%=listIndex %>'" /></td>
					<td colspa ="2">
					<form action="manOrderRmv">	
					<input type="hidden" name="listIndex" value=<%=listIndex %> />
					<input type="hidden" name="curOrderId" value=<%=curOrder.getOrder().getOrderId() %> />
					<input type="submit" value="删除" class="input2" />
				    </form>
					</td>
					</tr>
			</table>
			<%
				}
			 %>	</div>
			 <div class="details">
			<%  if(sign!=0)
			{
			%>
			 <jsp:include page="orderDetail.jsp"><jsp:param name="id" value="<%=sign%>"></jsp:param>
    </jsp:include>
			<% }%>
			 </div>
			 
	</div>
	
				
	</body>
	
</html>