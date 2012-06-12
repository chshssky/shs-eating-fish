<%@ page language="java" import="java.util.*" 
import="com.cheating.hib.*" 
import="org.hibernate.Criteria" 
import="org.hibernate.Session"
import="hibernate.*"
import="org.hibernate.criterion.Restrictions"	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<link rel="stylesheet" media="screen" type="text/css" href="css/addManager.css"/>

<html xmls="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
function showRest(str)
{
var xmlhttp;    
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","seeRestaurant.jsp?id="+str,true);
xmlhttp.send();
}
</script>
  </head>
  
  <body>
  <%
  	int id;
  	if(Integer.valueOf(request.getParameter("id"))==null)
  		id = 1;
  	else
  		id = Integer.valueOf(request.getParameter("id"));
   %>
  <div class="add">
  <fieldset id="fieldset">
    <legend>添加信息</legend>
  	<s:actionerror/>
    <s:form action="addManager">
    		<s:textfield name="loginName" label="登录名"/>
			<s:password name="password" label="设置密码"/>
			<s:password name="repassword" label="确认密码"/>
			<s:textfield name="managerName" label="管理员名字"/>
			<%
				Session se = HibernateSessionFactory.getSession();
				Criteria crit2 = se.createCriteria(Restaurantinfo.class);
				List<Restaurantinfo> restinfos = crit2.list();
				
			 %>
			 管理员所属餐馆
			<select name="restaurant" onchange="showRest(this.value)">
    			<%
    				for(Restaurantinfo info:restinfos)
    				{	
    			%>
    					<option value=<%=info.getRestaurantId()%>><%=info.getName()%></option>	
    			<%System.out.println(info.getRestaurantId());
    			System.out.println(info.getName());	
    			} se.close();%>
    		</select>
    		<s:submit value="注册"/>
			<s:reset value="重置"/>
	</s:form>
	<%
		if(id == 0)
		{
	 %>
	 <h4><font color="#9966CC" face="华文行楷">超出该餐馆的管理员上限，请删除旧管理员或修改管理员上限</font></h4>
	 <%
	 } %>
  </fieldset>
  </div>
  <div id="txtHint" >餐馆信息将在此处列出 ...</div>
  </body>
</html>
