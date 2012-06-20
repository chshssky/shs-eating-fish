<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"
pageEncoding="UTF-8" import="javax.swing.JOptionPane"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" media="screen" type="text/css" href="css/checkAllManagers.css"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'acknowledgeDelete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  	int id = Integer.valueOf(request.getParameter("param"));
  	Session se = HibernateSessionFactory.getSession();
    Criteria crit = se.createCriteria(Managerinfo.class);
    
	Logininfo logInfo = (Logininfo)se.load(Logininfo.class, id);
	crit.add(Restrictions.eq("logininfo", logInfo));
	List<Managerinfo> manainfo = crit.list();
	String name = manainfo.get(0).getName();
	String restName = manainfo.get(0).getRestaurantinfo().getName();
	System.out.println(name);
	System.out.println(restName);

   %>
   <div class="acknowledge">
   <table align="center" border="1">
   <tr>
   <th colspan="2"><h3>再次确认要删除的管理员信息</h3></th>
   </tr>
   <tr>
   <td>管理员登录名</td>
   <td><%=logInfo.getLoginName()%></td>
   </tr>
   <tr>
   <td>管理员姓名</td>
   <td><%=name %></td>
   </tr>
   <tr>
   <td>管理员所属餐馆</td>
   <td><%=restName %></td>
   </tr>
   <tr clospan="2">
   <td>
   <form action="acknowledgeDelete">
     <input type="hidden" name="managerID" value=<%=manainfo.get(0).getManagerId()%>></input>
     <input type="hidden" name="loginID" value=<%=manainfo.get(0).getLogininfo().getLoginId() %>></input>
     <input type="submit" value="删除此管理员"></input>
     </form>
   </td>
   </tr>
  
   </table>
   </div>
   <%	se.close(); %>
  </body>
</html>
