$(function () {

    .addPlugin('.collapse--header, .collapse--content', 'collapsePanel', ['l', 'xl']);
    
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
});
