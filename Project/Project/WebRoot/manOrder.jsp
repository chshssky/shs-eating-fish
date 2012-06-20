<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.cheating.hib.*" import="org.hibernate.Session" import="org.hibernate.Criteria"
import="org.hibernate.criterion.Restrictions" import="java.util.*" import="fish.man.manager.RestOrder"
import="fish.man.manager.SingleOrder" %>
<%
HttpServletResponse httpResponse = (HttpServletResponse) response;
httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
httpResponse.setDateHeader("Expires", 0); // Proxies.
%>
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

	<div class="head">
	  <div class="logo">
	   <img src="logo5.png" width="126" height="100"/>
	  </div>
	  <div class="welcome">
	 	<h1>Welcome to</h1><h2> EFC </h2><br/><h1>欢迎来到</h1><h2>EFC</h2><h1>网上订餐系统</h1>
	 	<h2> &nbsp &nbsp &nbsp Manager Page&nbsp &nbsp &nbsp
		 	<a href="index.jsp">登出</a></h2>
	 	&nbsp &nbsp &nbsp <a href="manager.jsp">return</a>
	 </div>
	 </div>
	

   		<div class="block3">	
   		<%
			int restId = (Integer)request.getSession().getAttribute("restId") ;
			Session se = HibernateSessionFactory.getSession();
			//se.clear();
			Restaurantinfo resInfo = (Restaurantinfo)se.load(Restaurantinfo.class, restId);
			
			Criteria critCo = se.createCriteria(Courseinfo.class);
			critCo.add(Restrictions.eq("restaurantinfo", resInfo));
			List<Courseinfo> coInfo = critCo.list();
			System.out.println("size:"+coInfo.size());
			for (Courseinfo cInfo : coInfo) 
			{
		%>
			<table border="2">
				<tr>
				<td colspan="4">菜名:<%=cInfo.getName() %></td>
				<td colspan="3">价格:<%=cInfo.getPrice() %></td>
				</tr>		
				<tr>
				<td>订单号</td>
				<td>菜品数量</td>
				<td>订单人</td>
				<td>订单号码</td>
				<td>订单地址</td>
				<td>状态</td>
				<td>配送</td>
				</tr>
		<%
				Criteria critOC = se.createCriteria(Ordercourses.class);
				critOC.add(Restrictions.eq("courseinfo", cInfo));
				List<Ordercourses> ocInfo = critOC.list();
				System.out.println("size2:"+ocInfo.size());
				for (Ordercourses ocsInfo: ocInfo)
				{
					if (ocsInfo.getState().equals("处理中"))
					{
		%>

					<tr>
					<td><%=ocsInfo.getOrderinfo().getOrderId() %></td>
					<td><%=ocsInfo.getNum() %></td>
					<td><%=ocsInfo.getOrderinfo().getLastName() %></td>
					<td><%=ocsInfo.getOrderinfo().getTelephoneNum() %></td>
					<td><%=ocsInfo.getOrderinfo().getAddress() %></td>
					<td><%=ocsInfo.getState() %></td>
					<td colspan ="2">
						<form action="delivery">	
						<input type="hidden" name="curOCId" value=<%=ocsInfo.getOrderCoursesId() %> ></input>
						<input type="hidden" name="curOrderId" value=<%=ocsInfo.getOrderinfo().getOrderId() %> />
						<input type="submit" value="已配送" class="input2" />
					    </form>
				    </td>
					</tr>
	
			<%		
					}
				}
			%>
			</table>
			<%
			
				
			}
			HibernateSessionFactory.closeSession();
			 %>	</div>

	</body>
	
</html>