jQuery(document).ready(function(){

    $('body').on('click', '.collapse--header', function(){
        console.log($(this));
        $(this).next('.collapse--content').slideToggle();
    });

})
