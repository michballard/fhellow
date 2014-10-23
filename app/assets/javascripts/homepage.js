//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

var promises;

  if($('#map').length > 0) {

    // Setting maps center coordinates
    var map = new GMaps( {
      div: '#map',
      lat: 51.524013,
      lng: -0.087467,
      scrollwheel: false,
      styles: [{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},
               {"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},
               {"featureType":"landscape.man_made","elementType":"geometry.fill"},
               {"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},
               {"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},
               {"featureType":"water","stylers":[{"color":"#7dcdcd"}]},
               {"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]}]
    });

    //Putting out the initial list of users
    var url = "/api/users";

    $.get(url, function(users){
      promises = populateUsers(users);

      Q.all(promises).then(function() {
        performLayout();
      });
    });

    // Adding a marker on the map for each user
    $.get(url, function(users){
      populateMap(users);
    });

    // Adding a marker for the current user (not sure if works)
    $('.location-setter').on('click', function(event){
        event.preventDefault();
        if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          $('#user_latitude').val(position.coords.latitude);
          $('#user_longitude').val(position.coords.longitude);
          map.addMarker({
            lat: (position.coords.latitude),
            lng: (position.coords.longitude),
            title: 'You!',
            icon:"/assets/user_marker.png",
            class: "user-marker",
            infoWindow: {
              content: "This is you!"
              }
           });
            if ($(".current_user_id").text()){
           $.post("/updatelocation?id=" + $(".current_user_id").text() + "&longitude=" +  $('#user_longitude').val() + "&latitude=" +  $('#user_latitude').val())
          }
        });
      }
    });

    //Gmap Set-up
    GMaps.geolocate({
      success: function(position) {
        map.setCenter(position.coords.latitude, position.coords.longitude);
      },
      error: function(error) {
        alert('Geolocation failed: '+ error.message);
      },
      not_supported: function() {
        alert("Your browser does not support geolocation");
      },
    });

    //Filtering users by interest
    $('#interests-form').on("change", function(){
      var checkedValues = $('input:checkbox:checked').map(function() {
        return this.name;
      }).get();

      $('.profile').html('');
      map.removeMarkers();

      url = "/api/users?interests=" + checkedValues.join(",");

      $.get(url, function(users){
          populateMap(users);
      });

      $.get(url, function(users){
        if($.isEmptyObject(users)) {
          $('.profile').first().append("No current users in your region with those interests :(");
        }
        else {
          promise = populateUsers(users);
        }

        Q.all(promise).then(function() {
          performReloadLayout();
        });
      });
    });
  }

  function populateMap(users){
    users.forEach(function(user){
      if (user.current_user_id == user.user_id) {
        map.addMarker({
        lat: user.latitude,
        lng: user.longitude,
        title: user.full_name,
        icon: "/assets/user_marker.png",
        class: "user-marker",
        infoWindow: {
          content: '<img src="' + user.image_url + '"><h2>' + "You!" + '</h2><p>'+ user.job_title+'</p><p>'+ user.town+'</p></p>'+ user.bio_truncated + '</p>'
                  }
        });
      }
      else {
      map.addMarker({
      lat: user.latitude,
      lng: user.longitude,
      title: user.full_name,
      icon: "/assets/fhellow_marker.png",
      class: "all-user-marker",
      infoWindow: {
          content: '<img src="' + user.image_url + '"><h2>' + user.full_name + '</h2><p>'+ user.job_title+'</p><p>'+ user.town+'</p></p>'+ user.bio_truncated + '</p>'
          }
       });
      }
    });
  }

  function populateUsers(users){
    return users.map(function(user){
      if(user.first_name != "guest"){
        var deferred = Q.defer();
        var template = $ ('.profile-template').html();
        $('.profile-container').append(Mustache.render(template, user));
        deferred.resolve(true);
        return deferred.promise;
    }
    });
  }

  function performLayout(){
    var $container = $('#profile-container');
    $container.isotope({
      itemSelector: '.child-container',
      layoutMode: 'masonry'
    });
  }

  function performReloadLayout(){
    var $container = $('#profile-container');
    $container.isotope('reloadItems').isotope({
      itemSelector: '.child-container',
      layoutMode: 'masonry'
    });
  }  
  
});


