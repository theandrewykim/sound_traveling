// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function($) {



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



$("#follow-container").on("click",".button_to", function(e){
  e.preventDefault()

  var $data = $(".recording").data().recordings.user_id
  var $url = $(this).attr("action")
  if($url == "/users/"+$data+"/relationships"){
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



