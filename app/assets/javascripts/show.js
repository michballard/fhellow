//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



// $(document).ready(function() {

// var promises;

//   url = "/api/users";

// //Putting out the initial list of users
//     $.get(url, function(users){
//       promises = populateUsers(users);

//       Q.all(promises).then(function() {
//         $('a.follow-toggle').on('click', function(event){
//           event.preventDefault();
//           var link = $(this).closest('a')
//           $.post(this.href, function(response){
//              link.text(response.follow)
//           });
//         });
//       });
//     });

// function populateUsers(users){
//       return users.map(function(user){
//         var deferred = Q.defer();
//         var template = $ ('.follow-template').html();

//         $('.follow-container').append(Mustache.render(template, user));
//         deferred.resolve(true);

//         return deferred.promise;
//       });
// }

// });

$('a.profile-follow-toggle').on('click', function(event){
  event.preventDefault();
  var link = $(this)
  $.post(this.href, function(response){
         link.text(response.follow)
  });
})
