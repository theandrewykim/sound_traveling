 function Location(latitude, longitude, title, created_at, id, map) {
  this.latitude = latitude;
  this.longitude = longitude;
  this.title = title;
  this.map = map;
  this.id = id;
  this.created_at = created_at;
  this.marker = new google.maps.Marker({position: new google.maps.LatLng(this.latitude, this.longitude)});
  this.infowindow = new google.maps.InfoWindow({content: '<a href="recordings/'+this.id+'">'+this.title+'</a>'});
  this.marker.setMap(this.map);
  this.addListenerToMarker();
}

Location.prototype.addListenerToMarker = function() {
  this.marker.addListener('click', function() {
    this.infowindow.open(this.map, this.marker);
  }.bind(this));
};

Location.prototype.dataForUpload = function() {
  return {latitude: this.latitude, longitude: this.longitude, title: this.title};
};

Location.prototype.saveToServer = function() {
  $.ajax({data: this.dataForUpload()});
};

var map;
var myCenter=new google.maps.LatLng(40.7064168,-74.0090889);
var locObjects;

function initialize() {
  var mapProp = {
    center:myCenter,
    zoom:2,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);


  locObjects = $('.recording').data('recordings').map(function(location) { return new Location(location.latitude, location.
    longitude, location.title, location.created_at, location.id, map) });

  var markerarray = []
  for (i=0; i< locObjects.length; i++) {
    markerarray.push(locObjects[i].marker)

  }
  var markerCluster = new MarkerClusterer(map, markerarray, {gridSize: 150});


}



google.maps.event.addDomListener(window, 'load', initialize);
