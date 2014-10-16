/*var lat = document.getElementById("#post_lat");*/
/*var lng = document.getElementById("#post_lng");*/

  $("#latlng").on('click', function(){

   if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        $('#post_latitude').val(position.coords.latitude);
        $('#post_longitude').val(position.coords.longitude);
   })
  /* else {*/
      //alert("Geolocation is not supported by this browser.");
      /*})*/
    };
  });


/*function showPosition(position) {*/
    //lat.val(position.coords.latitude);
    //lng.val( position.coords.longitude);
//}

