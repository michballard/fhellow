//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  var map = new GMaps({
    div: '#map',
    lat: 51.524013,
    lng: -0.087467
  });

  url = "/api/users"
    // ?interests=" + checkedValues.join(",")

    var userData = $.get(url, function(users){
      var template = $ ('.profile-template').html();
      console.log(template);
      users.forEach(function(user){
        console.log(user);
        $('.profile-container').append(Mustache.render(template, user));
      })
    });


  $.get("/api/users", function(users){
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


  $('#interests-form').on("change", function(){ 

    var checkedValues = $('input:checkbox:checked').map(function() {
      return this.name;
    }).get();

    url = "/api/users"
    // ?interests=" + checkedValues.join(",")

    var userData = $.get(url, function(users){
      var template = $ ('.profile-template').html();
      console.log(template);
      users.forEach(function(user){
        console.log(user);
        $('.profile-container').append(Mustache.render(template, user));
      })
    });
  });

   



// $('input[type="checkbox"][name="advising"]').change(function() {
//      if(this.checked) {
//         $.get("/api/users", function(users){
//           users.forEach(function(user){
//             return(user if (user.this.name == true))
//          var options = {
//           valueNames: [ 'interests' ]
//          };
//          var userList = new List('search-container', options);
//          };
//       })
// $("#txtAge").toggle(this.checked);


});


