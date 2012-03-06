if (typeof rah === 'undefined') { rah = {};}

// ==============================================================================================================
rah.home = (function($, undefined){
  function init() {

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

    // If no browser support for required attribute
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