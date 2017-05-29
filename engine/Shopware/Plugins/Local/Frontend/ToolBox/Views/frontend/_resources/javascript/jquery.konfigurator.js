
;(function($, window, undefined) {
    $('body').on('click', '.collapse--header', function(){
        console.log($(this));
        $(this).next('.collapse--content').slideToggle();
    });
})(jQuery, window);
