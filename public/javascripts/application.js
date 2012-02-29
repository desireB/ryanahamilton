if (typeof rah === 'undefined') { rah = {};}

// ==============================================================================================================
rah.home = (function($, undefined){
  function init() {

    // Initializes Facebox
    $('a[rel*=facebox]').facebox();

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