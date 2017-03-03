$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".container").on('submit', "form#find-city", function(event){
    event.preventDefault();
    // console.log("prevent");
    // console.log($(this).attr("action"))
    // console.log($(this).attr("method"))
    var route = $(this).attr("action")
    var method = $(this).attr("method")
    var data = $(this).serialize();
    $.ajax({
      url: route,
      method: method,
      data: data
    })
    .done(function(response){
      $('li').remove();
      var listItem = "<li></li>"
      console.log(response);
      console.log(response["data"]["widget"]);
      // console.log(response["data"]["categories"][0]["name"])
      var data = response["data"]["categories"];
      for(i=0; i< data.length-2; i++ ){
        $('ul').append("<li style="+data[i]["color"]+">"+data[i]["name"]+ ": "+ data[i]["score_out_of_10"]+"</li>")}

      // console.log($('form#find-city'))
      $('form#find-city')[0].reset();
    })
  })
});
