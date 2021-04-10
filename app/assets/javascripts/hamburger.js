$(document).on('turbolinks:load', function(){
  $('.hamburger').on('click', function(){
    $('nav').toggleClass('open');
  });
});
