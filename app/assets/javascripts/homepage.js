//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready(function() {

var promises;


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

  url = "/api/users";

//Putting out the initial list of users
    $.get(url, function(users){
      promises = populateUsers(users);

      Q.all(promises).then(function() {
        $('.follow-toggle').on('click', function(event){
          event.preventDefault();
          $.post(this.href, function(response){
            $(this).text(response.follow);
          });
        });
      });
    });

// Adding a marker on the map for each user
  $.get("/api/users", function(users){
    populateMap(users);
  });

// Adding a marker for the current user (not sure if works)
  map.addMarker({
    lat: $('.lat').text(),
    lng: $('.lng').text(),
    title: 'Fhellow',
    class: "current-user-marker",
    infoWindow: {
    content: '<p>HTML Content</p>'
    }
  });

//Gmap Set-up
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

//Filtering users by interest
  $('#interests-form').on("change", function(){
    var checkedValues = $('input:checkbox:checked').map(function() {
      return this.name;
    }).get();

    $('.profile').html('');
    url = "/api/users?interests=" + checkedValues.join(",")
    $.get(url, function(users){
      if($.isEmptyObject(users)) {
        //$('.profile-container').html('');
        map.removeMarkers()
        $('.profile').first().append("No current users in your region with those interests :(")
      }
      else {
        promises = populateUsers(users);
        map.removeMarkers()
        populateMap(users)
      }

      Q.all(promises).then(function() {
        $('.follow-toggle').on('click', function(event){
          event.preventDefault();
          $.post(this.href, function(response){
            $(this).text(response.follow);
          });
        });
      });
    });
  });

function populateMap(users){
      users.forEach(function(user){
        map.addMarker({
        lat: user.latitude,
        lng: user.longitude,
        title: user.full_name,
        icon: "/assets/marker_other_fhellows.png",
        class: "all-user-marker",
        infoWindow: {
            content: '<img src="' + user.image_url + '"><h2>' + user.full_name + '</h2><p>'+ user.job_title+'</p><p>'+ user.town+'</p></p>'+ user.bio_truncated + '</p>'
                    }
         });
      });

}

function populateUsers(users){
      return users.map(function(user){
        var deferred = Q.defer();
        var template = $ ('.profile-template').html();

        $('.profile-container').append(Mustache.render(template, user));
        deferred.resolve(true);

        return deferred.promise;
      });
}



});




