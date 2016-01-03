// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require wow.min
//= require_tree .

$(document).on('ready page:load', function () {

  echo.init({
    offset: 10000,
    throttle: 250,
    unload: false
  });

  $('.flickr-photo').on('click', function(ev){
    var imgUrl = $(this).data('large');
    var imgOverlay = $('<img>').addClass('overlay').attr('src', imgUrl);
    var overlayContainer = $('<div>').addClass('overlay-container');
    $(overlayContainer).append(imgOverlay);
    $('body').append(overlayContainer);
    $(document).on('click', 'img.overlay,div.overlay-container', function() { $(overlayContainer).remove(); });
  });

  var navbar = $('.navbar');
  var navHeight = navbar.height();

  new WOW({mobile: false}).init();

  $(window).scroll(function() {
    if($(this).scrollTop() >= navHeight) {
        navbar.addClass('navbar-color');
    }
    else {
        navbar.removeClass('navbar-color');
    }
  });

})
