if (typeof rah === 'undefined') { rah = {};}

// ==============================================================================================================
rah.home = (function($, undefined){
  function init() {

    // Fade in of header, aesthic value only
    $('header').fadeIn(1400);

    // Initializes Facebox
    $('a[rel*=facebox]').facebox();

    // Add smooth scrolling to nav links
    $('nav a').anchorAnimate();

    // Check the initial Poistion of the Sticky Header
    var stickyNavTop = $('nav').offset().top;

    $(window).scroll(function(){
      if( $(window).scrollTop() > stickyNavTop ) {
              $('nav').addClass('fixed');
      } else {
              $('nav').removeClass('fixed');
      }
    });

    // Form validation if browser doesn't support reuired attributes on input/textarea elements
    // if !(Modernizr.input.required) {
    //
    // }


  }

  return {
    init: init
  }
})(jQuery);

// ==============================================================================================================
$(function(){
  rah.home.init();
});