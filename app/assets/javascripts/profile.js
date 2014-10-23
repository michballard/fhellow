//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$('a.profile-follow-toggle').on('click', function(event){
  event.preventDefault();
  var link = $(this);
  var span = $(this).children()
  var i = $(this).siblings()
  var followerCount = $('.follower-count');
  var followingCount = $('.following-count');
  $.post(this.href, function(response){
         // console.log(i.attr("class"))
         i.toggleClass("fa-minus fa-plus")
         link.removeClass("Following Unfollow")
         span.text(response.follow);
         link.addClass(response.follow)
         followerCount.text(response.new_follower_count);
         followingCount.text(response.new_following_count);
  });
});

$(document).ready(function() {
  var url = window.location.href;
  if(url.endsWith('/show')) {
    $('.child-container').addClass('profile-child-container').removeClass('activity-child-container');
  }

  var $container = $('#profile-post-container');
  $container.isotope({
    itemSelector: '.profile-child-container',
    layoutMode: 'masonry'
  });
});

String.prototype.endsWith = function(suffix) {
  return this.indexOf(suffix, this.length - suffix.length) !== -1;
};