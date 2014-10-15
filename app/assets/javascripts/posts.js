var lat = document.getElementById("lat");
var lng = document.getElementById("lng");

$("#latlng").on('click', function(){

 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else
    {
      lat.innerHTML = ("Geolocation is not supported by this browser.");
    }
});

function showPosition(position) {
    lat.innerHTML = position.coords.latitude;
    lng.innerHTML = position.coords.longitude;
}

