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

<form>
<table>

			<tr>
				<td>菜名</td>
				<td>数量</td>
			</tr>
	<%	
		Iterator<Item> cart_list = mycart.getCart().iterator() ;	
		Item item = new Item() ;
		Courseinfo course = new Courseinfo();
		
		while(cart_list.hasNext())
		{
			item = cart_list.next() ;
			//hibernate我不熟，下面两行报错：Courseinfo cannot be resolved to a variable
			//course = (Courseinfo)HibernateSessionFactory.getSession().load(Courseinfo, item.getCourse_id()) ;
	 		//out.print("<tr><td>" + course.getName() + "</td>") ;
	 		
	 		out.print("<tr><td>" + item.getCourse_id() + "</td>") ;
	 		out.print("<td>" + item.getCourse_num() + "</td></tr>") ;	 		
		}
	 %>

</table> 
</form>

</body>
</html>
