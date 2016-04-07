// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {

  $("#new_comment").on("submit",function(e){

    var url = $(".new_comment").attr("action");
    var that = $(".commentList");

    e.preventDefault();
    $.ajax({
      type: 'POST',
      url: url,
      data: $(this).serialize()
    }).done(function(response) {
      that.prepend(response)
      $("#new_comment")[0].reset()
      }).fail(function(error){
        $('#loginModal').modal('show');
      })

  });


});




