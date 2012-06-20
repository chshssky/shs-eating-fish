<%@ page language="java" 
import="java.util.*" 
import="org.hibernate.*"
import="hibernate.*"
import="com.cheating.hib.*"
pageEncoding="gb2312" %>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDx-Lt6Fo7PcTJor_zjtlp8IXyb4Drk5TQ&sensor=true">
    </script>
    <script type="text/javascript">
   		var myLatlng = new  google.maps.LatLng(31.270335, 121.504841);
		function initialize() {
		  var myOptions = {
		    center: myLatlng,
		    zoom: 13,
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  };
		  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		  var marker = [];
		  
    <%
    	Session se = HibernateSessionFactory.getSession();
		Criteria crit = se.createCriteria(Restaurantinfo.class);
		List<Restaurantinfo> resinfos = crit.list();
		int i = 0;
		for (Restaurantinfo res : resinfos) {
			System.out.println("Lat:"+res.getLatitude()+"   Lng:"+res.getLongtitude());
			i ++;
	%>		
			
			var latlng = new  google.maps.LatLng(<%=res.getLatitude()-0.006%>, <%=res.getLongtitude()%>);
		  	marker[<%=i%>] = new google.maps.Marker({
		      	position: latlng,
		     	 map: map,
		     	// draggable: true,
		      	title:"<%=res.getName()%>",
		      	animation: google.maps.Animation.DROP
		  	});
		  	marker[<%=i%>].setMap(map);
		  	google.maps.event.addListener(marker[<%=i%>], 'dblclick', function() {
			  	window.location.href="showRestaurant.jsp?id="+<%=i%>;
		  	});			



		  	google.maps.event.addListener(marker[<%=i%>], 'click', function() {
				var contentString = '<div id="content">'+
				    '<div id="siteNotice">'+
				    '</div>'+
				    '<h2 id="firstHeading" class="firstHeading"><%=res.getName()%></h1>'+
				    '<div id="bodyContent">'+
				    '<p><b>µÿ÷∑£∫</b>'+ 
				    '<%=res.getAddress()%></p>'+
				    '<p>«Îø¥:<a href="showRestaurant.jsp?id=<%=i%>">'+
				    'æ∆µÍœÍ«È</a> ª∂”≠∂©≤Õ~~</p>'+
				    '</div>'+
				    '</div>';
				var infowindow = new google.maps.InfoWindow({
				    content: contentString
				});    
				infowindow.open(map,marker[<%=i%>]);
		  	});									  		
	<%		
		}
     %>

	 
		}

    </script>
  </head>
  <body onload="initialize()">
    <div id="map_canvas" style="width:100%; height:100%"></div>
  </body>
</html>