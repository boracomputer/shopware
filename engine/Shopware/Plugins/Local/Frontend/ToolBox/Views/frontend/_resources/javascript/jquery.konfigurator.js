jQuery(document).ready(function(){

    $('body').on('.collapse--header', 'click', function({
        $(this).next('.collapse--content').slideToggle();
    }));
    
})
