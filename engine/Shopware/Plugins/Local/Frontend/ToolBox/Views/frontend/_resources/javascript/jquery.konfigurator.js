jQuery(document).ready(function(){

    $('body').on('.collapse--header', 'click', function(){
        console.log($(this));
        $(this).next('.collapse--content').slideToggle();
    });

})
