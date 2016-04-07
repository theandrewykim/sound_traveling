$(document).ready(function(){

 console.log("whooo");
  $("#follow-container1").on("submit","form", function(e){

    e.preventDefault()
    var type;
    var $id = $(".recording").data().recordings[0].user_id
    var $url = $(this).attr("action")

    if($url == "/users/"+$id+"/relationships"){
      type = "POST"
    }
    else{
      type = "DELETE"
    }
    $.ajax({
      type: type,
      url: $url,
      data: $(this).serialize
    })
    .done(function(response){
      $("#follow-container1").html(response)
    })
    .fail(function(error){debugger})
  })
})
