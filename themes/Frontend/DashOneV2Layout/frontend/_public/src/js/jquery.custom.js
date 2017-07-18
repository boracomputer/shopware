$(function () {

    $('body').on( 'click', '.js--toggle-trigger', function (e) {
        e.preventDefault();
        var t=$(this).attr('data-target');
        $('.js--toggle-target:not('+t+')').slideUp("fast", function(){
        });
        $(t).slideToggle( "fast", function() {
        });
        return false;
    });
    $('body').on( 'click', '.js--toggle-close', function (e) {
        e.preventDefault();
        $(this).parents('.js--toggle-target').first().slideUp("fast", function(){
        });
        return false;
    });

    $('.product--box').on('click', '.action--quickview', function(e){
        e.preventDefault();
        var t = $(this);
        $.loadingIndicator.open();
        $.ajax({
            url: t.attr('href'),
            success: function (data) {
                $.loadingIndicator.close(function(){
                    var $d = $('<div/>', {
                        html: data
                    });
                    $.modal.open( $d, {
                        width: 800,
                        title: t.attr('data-title'),
                    });
                });
            }
        });
    });
});
