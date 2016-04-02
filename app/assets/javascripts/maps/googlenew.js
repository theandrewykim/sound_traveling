var recordings = [];
function RecordingLoc(latitude, longitude) {
  this.latitude = latitude;
  this.longitude = longitude;
}


$(document).ready(function()
{

function initialize() {
  var mapProp = {
    zoom:3,
    center: new google.maps.LatLng(40.7064168,-74.0090889),
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("route2"),mapProp);

google.maps.event.addListener(map, 'click', function(e) {
        placeMarker(e.latLng, map);
        var latitude = e.latLng.lat();
        var longitude = e.latLng.lng();


        if (recordings.length === 0) {
           var location = new RecordingLoc(latitude, longitude);

           recordings.push(location);
           $(".new_recording").prepend("<input type='hidden' name='recording[latitude]' value="+location.latitude+" id= 'amihere' >");
           $(".new_recording").prepend("<input type='hidden' name='recording[longitude]' value="+location.longitude+" >");


        }

      });


      function placeMarker(position, map) {
        var marker = new google.maps.Marker({
          position: position,
          map: map
        });
        map.panTo(position);

      }

}
google.maps.event.addDomListener(window, 'load', initialize);

})


