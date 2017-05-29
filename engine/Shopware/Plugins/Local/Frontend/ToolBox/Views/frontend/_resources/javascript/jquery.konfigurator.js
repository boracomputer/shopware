
;(function($, window, undefined) {
    $(document).ready(function() {
        $('body').on('click', '.collapse--header', function(){
            console.log($(this));
            $(this).next('.collapse--content').slideToggle();
        });
    });
})(jQuery, window);
