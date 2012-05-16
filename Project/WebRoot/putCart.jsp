<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="fish.operation.cart.*" import="com.cheating.hib.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			</tr>
</table>
	<%	
		Iterator<Item> cart_list = mycart.getCart().iterator() ;	
		Item item = new Item() ;
		Courseinfo course = new Courseinfo();
		
		while(cart_list.hasNext())
		{
			item = cart_list.next() ;
			course = (Courseinfo)HibernateSessionFactory.getSession().load(Courseinfo.class, item.getCourse_id()) ;
	%>
	<form action="rmv_course">
	<table>
	 		<tr>
	 			<td><%=course.getName()%></td>
	 			<td><%=item.getCourse_num()%></td>
	 			<td><input type="hidden" name="course_id" value=<%=item.getCourse_id()%>></input></td>
	 			<td><input type="submit" value="删除"></input></td>
	 		</tr>
	 </table>
	 </form>			 
	<%	
		}
	 %>


</body>
</html>
