<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="fish.operation.cart.*" import="com.cheating.hib.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><br>

<jsp:useBean id="mycart" class="fish.operation.cart.Cart" scope="session"/> 


<table>

			<tr>
				<td>菜名</td>
				<td>数量</td>
				<td>单价</td>
			</tr>
</table>
	<%	
		Iterator<Item> cart_list = mycart.getCart().iterator() ;	
		Item item = new Item() ;
		Courseinfo course = new Courseinfo();
		int sum_price = 0;
		
		while(cart_list.hasNext())
		{
			item = cart_list.next() ;
			course = (Courseinfo)HibernateSessionFactory.getSession().load(Courseinfo.class, item.getCourse_id()) ;
			sum_price += course.getPrice() ;
	%>
	<s:actionerror/>
	<form action="rmv_course">
		<table>
	 		<tr>
	 			<td><%=course.getName()%></td>
	 			<td><%=item.getCourse_num()%></td>
	 			<td><%=course.getPrice()%></td>
	 			<td><input type="hidden" name="course_id" value=<%=item.getCourse_id()%>></input></td>
	 			<td><input type="submit" value="删除"></input></td>
	 		</tr>
	 	</table>
	 </form>			 
	<%	
		}
	 %>

	总金额：<%=sum_price %>
	<form action="submit_order">
		<input type="submit" value="提交订单"></input>
	</form>

</body>
</html>
