$(window).load(function(){
  var $container = $('#post-activity-container');
  $container.isotope({
    itemSelector: '.post-child-container',
    layoutMode: 'masonry'
  });
});