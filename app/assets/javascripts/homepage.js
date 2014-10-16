//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  var map = new GMaps({
    div: '#map',
    lat: 51.524013,
    lng: -0.087467
  });


  $.get("/api/users", function(users){
  
    console.log(users);
    users.forEach(function(user){
        map.addMarker({
        lat: user.latitude,
        lng: user.longitude,
        title: user.full_name,
        class: "all-user-marker",
        infoWindow: {
            content: '<img src="' + user.image_url + '"><h2>' + user.full_name + '</h2><p>'+ user.job_title+'</p></p>'+ user.bio_truncated + '</p>'
        }
         });
    });
  });


  map.addMarker({
    lat: $('.lat').text(),
    lng: $('.lng').text(),
    title: 'Fhellow',
    class: "current-user-marker",
    infoWindow: {
    content: '<p>HTML Content</p>'
    }
  });

  GMaps.geolocate({
  success: function(position) {
    map.setCenter(position.coords.latitude, position.coords.longitude);
  },
  error: function(error) {
    alert('Geolocation failed: '+error.message);
  },
  not_supported: function() {
    alert("Your browser does not support geolocation");
  },
});
});


