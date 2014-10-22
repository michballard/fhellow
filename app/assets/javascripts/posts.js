$(document).ready(function () {
    $("#latlng").on('click', function () {

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
              $('#post_lat').val(position.coords.latitude);
              $('#post_lng').val(position.coords.longitude);
            });
        }
    });
});
