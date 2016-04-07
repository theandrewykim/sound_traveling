// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function($) {

  var data = $('.recording_params').data();


  var playerParams = {
        title: data.recordingname,
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




$("#dropdown").on("submit",function(e){
var $playlistID = $('#form :selected').val()
var $recordingID = $("#form").attr("action")
e.preventDefault()
$.ajax({
  type: 'POST',
  url: $recordingID+'/playlists/'+$playlistID+'/playlistrecordings',
  data: $(this).serialize()
}).done(function(response){
$("#dropdown").prepend("Added to playlist!")

})
})


$("h3").on("click", "i", function(e){
e.preventDefault();
var $that = $(this)
var $recordingid = $(".recording").data().recordings.id

if($("#unlike").attr("href") ==  "/recordings/"+$recordingid+"/unlike"){
    var url = "/recordings/"+$recordingid+"/unlike"
  }
else {
   var url = "/recordings/"+$recordingid+"/like"
 }
  $.ajax({
    type: 'PUT',
    url: url,
    data: $(this).serialize
  }).done(function(response){
   $("#like-container").html(response)

    }).fail(function(error){debugger})
  })



$(".container").on("click",".button_to", function(e){
  e.preventDefault()

  var $url = $(this).attr("action")
  if($url == "/users/4/relationships"){
    var type = "POST"
  }
  else{
    var type = "DELETE"
  }
    $.ajax({
    type: type,
    url: $url,
    data: $(this).serialize
  }).done(function(response){
   $("#follow-container").html(response)

    }).fail(function(error){debugger})



})


});



