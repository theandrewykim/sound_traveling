  function initialize() {
  var data = $('.recording_params').data()
  var mapProp = {
    center:new google.maps.LatLng(data.latitude, data.longitude),
    zoom: 8,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  var marker = new google.maps.Marker({position: new google.maps.LatLng(data.latitude, data.longitude)});
  	marker.setMap(map)
}
google.maps.event.addDomListener(window, 'load', initialize);
