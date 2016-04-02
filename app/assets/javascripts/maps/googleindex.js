function Location(latitude, longitude, title, created_at, map) {
  this.latitude = latitude;
  this.longitude = longitude;
  this.title = title;
  this.map = map;
  this.created_at = created_at;
  this.marker = new google.maps.Marker({position: new google.maps.LatLng(this.latitude, this.longitude)});
  this.infowindow = new google.maps.InfoWindow({content: this.title + ' on ' + this.created_at});
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

// var first = {latitude: 40.7060794, longitude:-74.00932130000001, title: "This is a building"}
// var second = {latitude: 40.7064168, longitude:-74.0090889, description: "This is DBC"}


// var locations = [first,second]
var map;
var myCenter= new google.maps.Map.LatLng(40.7064168,-74.0090889);
var locObjects;

function initialize() {
  var mapProp = {
    center:myCenter,
    zoom:2,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
  // var marker=new google.maps.Marker({
  // position: mapProp.center,
  // });

  locObjects = $('.recording').data('recordings').map(function(location) { return new Location(location.latitude, location.longitude, location.title, location.created_at, map) });
}


google.maps.event.addDomListener(window, 'load', initialize);
//set var marker, probably going to use react to continuously update marker collection to iterate through
