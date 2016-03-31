function Location(latitude, longitude, description, map) {
  this.latitude = latitude;
  this.longitude = longitude;
  this.description = description;
  this.map = map;
  this.marker = new google.maps.Marker({position: new google.maps.LatLng(this.latitude, this.longitude)});
  this.infowindow = new google.maps.InfoWindow({content:'Description: '+ this.description});
  this.marker.setMap(this.map);
  this.addListenerToMarker();
}

Location.prototype.addListenerToMarker = function() {
  this.marker.addListener('click', function() {
    this.infowindow.open(this.map, this.marker);
  }.bind(this));
}

Location.prototype.dataForUpload = function() {
  return {latitude: this.latitude, longitude: this.longitude, description: this.description};
}

Location.prototype.saveToServer = function() {
  $.ajax({data: this.dataForUpload()})
}


var first = {latitude: 40.7060794, longitude:-74.00932130000001, description: "This is a building"}
var second = {latitude: 40.7064168, longitude:-74.0090889, description: "This is DBC"}
var locations = [first,second]
var map;
var mapplaces = []
var myCenter=new google.maps.LatLng(40.7064168,-74.0090889);
var locObjects;

function initialize() {
  var mapProp = {
    center:myCenter,
    zoom:18,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  // var marker=new google.maps.Marker({
  // position: mapProp.center,
  // });

  locObjects = locations.map(function(location) { return new Location(location.latitude, location.longitude, location.description, map) })
}




// function placeMarker(location) {
//   var marker = new google.maps.Marker({
//     position: location,
//     map: map,
//   });
//   var infowindow = new google.maps.InfoWindow({
//     content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
//   });
//   infowindow.open(map,marker);
// }

google.maps.event.addDomListener(window, 'load', initialize);
//set var marker, probably going to use react to continuously update marker collection to iterate through
