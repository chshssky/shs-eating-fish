<!DOCTYPE html>
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
   		var myLatlng = new  google.maps.LatLng(31.254, 121.483);
		function initialize() {
		  var myOptions = {
		    center: myLatlng,
		    zoom: 12,
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  };
		  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		 
	 
		  var marker = new google.maps.Marker({
		      position: myLatlng,
		      map: map,
		     // draggable: true,
		      title:"Hello World!",
		      animation: google.maps.Animation.DROP
		  });
		  marker.setMap(map);
		  google.maps.event.addListener(marker, 'click', function() {
			  if (marker.getAnimation() != null) {
			    marker.setAnimation(null);
			  } else {
			    marker.setAnimation(google.maps.Animation.BOUNCE);
			  }
		  });	
		  
		}

    </script>
  </head>
  <body onload="initialize()">
    <div id="map_canvas" style="width:100%; height:100%"></div>
  </body>
</html>