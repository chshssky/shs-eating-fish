<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加控件</title>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
</head>
<body>
<div style="width:800px;height:800px;border:1px solid gray" id="container"></div>
</body>
</html>
<script type="text/javascript">

var map = new BMap.Map("container");  
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  
map.addControl(new BMap.NavigationControl());  

</script>
