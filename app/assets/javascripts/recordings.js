// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function($) {

  var data = $('.recording_params').data();

  var playerParams = {
        title: data.title,
        mp3: data.url
      }

  $("#jquery_jplayer_audio_1").jPlayer({

    ready: function(event) {
      $(this).jPlayer("setMedia", playerParams );
    },
    play: function() { // Avoid multiple jPlayers playing together.
      $(this).jPlayer("pauseOthers");
    },
    timeFormat: {
      padMin: false
    },
    swfPath: "js",
    supplied: "mp3",
    cssSelectorAncestor: "#jp_container_audio_1",
    useStateClassSkin: true,
    autoBlur: false,
    smoothPlayBar: true,
    remainingDuration: true,
    keyEnabled: true,
    keyBindings: {
      // Disable some of the default key controls
      loop: null,
      muted: null,
      volumeUp: null,
      volumeDown: null
    },
    wmode: "window"
  });




// function initMap() {

//   var styleArray = [
//     {
//       featureType: "all",
//       stylers: [
//        { saturation: -80 }
//       ]
//     },{
//       featureType: "road.arterial",
//       elementType: "geometry",
//       stylers: [
//         { hue: "#00ffee" },
//         { saturation: 50 }
//       ]
//     },{
//       featureType: "poi.business",
//       elementType: "labels",
//       stylers: [
//         { visibility: "off" }
//       ]
//     }
//   ];
//   // Create a map object and specify the DOM element for display.
//   var map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: data.latitude, lng: data.longitude},
//     scrollwheel: false,
//     zoom: 8
//   });
// }




});

