<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="fish.operation.cart.*"%>

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
	<%	
		//mycart不为空，但其成员为空。。。为什么呢？？？
		
		if(mycart.getCart()==null)
			System.out.println("wwwawaw") ;
		if(mycart.getCart().isEmpty())
			System.out.println("empty") ;
			
		Iterator<Item> cart_list = mycart.getCart().iterator() ;	
		while(cart_list.hasNext())
		{
			System.out.println("yeah") ;
			Item item = cart_list.next() ;
			System.out.println(item.getCourse_id()+"2") ;
	 		out.print("<tr><td>"+item.getCourse_id()+"</td>") ;
	 		out.print("<td>"+item.getCourse_num()+"</td></tr>") ;	 		
		}
		
	 %>
	 </table> 
</body>
</html>
