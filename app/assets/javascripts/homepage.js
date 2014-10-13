//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

new GMaps({
  div: '.map',
  lat: -0.087467,
  lng: 51.524013
});

map.addMarker({
  lat: -0.087467,
  lng: 51.524013,
  title: 'Fhellow',
  click: function(e) {
    alert('You clicked in this marker');
  }
});

infoWindow: {
  content: '<p>HTML Content</p>'
}
