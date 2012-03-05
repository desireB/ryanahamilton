if (typeof rah === 'undefined') { rah = {};}

// ==============================================================================================================
rah.home = (function($, undefined){
  function init() {

    // Initializes Facebox
    $('a[rel*=facebox]').facebox();


    // Check the initial Poistion of the Sticky Header
    var stickyNavTop = $('nav').offset().top;

    $(window).scroll(function(){
      if( $(window).scrollTop() > stickyNavTop ) {
              $('nav').addClass('fixed');
      } else {
              $('nav').removeClass('fixed');
      }
    });



    // Fallback if placeholder attribute is not supported
    // if(!Modernizr.input.placeholder) {
    //
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