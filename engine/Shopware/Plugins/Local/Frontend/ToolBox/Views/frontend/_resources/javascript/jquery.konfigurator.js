
;(function($, window, undefined) {
    $(document).ready(function() {
        $('body').on('click', '.collapse--header', function(){
            $(this).next('.collapse--content').slideToggle();
        });
        $('.konfigurator--group--item').on('click', 'input[type="radio"]', function(){
            updateGroupHeader($(this));
            updateTotalPrice();
            // update caching
        });
    });

    function updateTotalPrice(){
        var t = 0;
        $('.item--input:selected').each(function(){
            t += $(this).parent('label').parent('.konfigurator--group--item').attr('data-itemPrice');
        });
        $('.konfigurator--footer .price').html(t);
    }

    function updateGroupHeader( el ){
        var h = el.parents('.collapse--content').first().prev('.collapse--header');
        h.find('.item-selected--name').text( el.next('.articleName').text() );
        h.find('.item-selected--price').text( el.next('.articleName').next('.articlePrice').text() );
    }

})(jQuery, window);
