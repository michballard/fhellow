$(document).ready(function () {
    $("#latlng").on('click', function () {

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
              $('#post_latitude').val(position.coords.latitude);
              $('#post_longitude').val(position.coords.longitude);
            });
        }
    });
});
