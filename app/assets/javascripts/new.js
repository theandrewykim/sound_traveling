var recordings = [];
  var markerarray = []
  function RecordingLoc(latitude, longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  function initialize() {

    var mapProp = {
      zoom:15,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    };
    var map=new google.maps.Map(document.getElementById("route2"),mapProp);
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    google.maps.event.addListener(map, 'click', function(e) {
      if (markerarray.length >0){
        for (i=0; i< markerarray.length; i++){
          markerarray[i].setMap(null)
        }
        markerarray = []
      }
      placeMarker(e.latLng, map);



    });


    function placeMarker(position, map) {
      var marker = new google.maps.Marker({
        position: position,
        map: map
      });
      markerarray.push(marker)


      map.panTo(position);
      var latitude = marker.position.lat();
      var longitude = marker.position.lng();
      if(recordings.length > 0) {
       recordings = []
       $(".reclocation").remove()


     }
     var location = new RecordingLoc(latitude, longitude);
     recordings.push(location);
     $(".new_recording").prepend("<input type='hidden' class='reclocation' name='recording[latitude]' value="+location.latitude+" id= 'amihere' >");
     $(".new_recording").prepend("<input type='hidden' class='reclocation' name='recording[longitude]' value="+location.longitude+" >");



   }

   searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (markerarray.length == 0) {
      markerarray.push(placeMarker(places[0].geometry.location, map))
    }

    else if (markerarray.length > 0) {
      markerarray[0].setMap(null)
      markerarray= []
      var anothermarker = placeMarker(places[0].geometry.location, map)
      markerarray.push(anothermarker)


    }

  })

   if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
    // Browser doesn't support Geolocation
    else {
      browserSupportFlag = false;
      handleNoGeolocation(browserSupportFlag);
    }

    function handleNoGeolocation(errorFlag) {
      if (errorFlag == true) {
        map.setCenter(new google.maps.LatLng(0,0))
        map.setZoom(0)

      }

      map.setCenter(initialLocation);
    }

  }
  google.maps.event.addDomListener(window, 'load', initialize);
