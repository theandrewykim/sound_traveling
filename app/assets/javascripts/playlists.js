$( document ).ready(function() {

  $("body").on("submit",".new_playlistrecording", function(e){
    var url = $(this).attr("action");
    var $remove = $(this).parent()
    var $prepend = $remove.parent()
    e.preventDefault();
    $.ajax({
      type: 'POST',
      url: url,
      data: $(this).serialize()
    }).done(function(response) {
      $remove.remove()
      $prepend.prepend(response)
      }).fail(function(error){
      })

  });

    $("body").on("submit",".edit_playlistrecording", function(e){
    var url = $(this).attr("action");
    var $remove = $(this).parent()
    var $prepend = $remove.parent()
    e.preventDefault();
    $.ajax({
      type: 'DELETE',
      url: url,
      data: $(this).serialize()
    }).done(function(response) {
      $remove.remove()
      $prepend.prepend(response)
      }).fail(function(error){
      })

  });



});




