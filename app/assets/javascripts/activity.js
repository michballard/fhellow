$(document).ready(function() {
  var url = window.location.href;
  if (url.endsWith('/show') === false) {
    $('.child-container').addClass('activity-child-container').removeClass('profile-child-container');
  }
  var $container = $('#activity-post-container');
  $container.isotope({
    itemSelector: '.activity-child-container',
    layoutMode: 'masonry'
  });
});

String.prototype.endsWith = function(suffix) {
  return this.indexOf(suffix, this.length - suffix.length) !== -1;
};