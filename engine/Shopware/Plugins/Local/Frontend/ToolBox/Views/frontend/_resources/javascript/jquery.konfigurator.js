
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
        $('.item--input:checked').each(function(){
            console.log($(this));
            t += parseInt($(this).parent('label').parent('.konfigurator--group--item').attr('data-itemPrice'));
            console.log(t);
        });
        $('.konfigurator--footer .price').html( t.format(2, 3, '.', ',') + ' &euro;*' );
        return t.format(2, 3, '', '.');
    }

    function updateGroupHeader( el ){
        var h = el.parents('.collapse--content').first().prev('.collapse--header');
        h.find('.item-selected--name').text( el.next('.articleName').text().trunc(50) );
        h.find('.item-selected--price').text( el.next('.articleName').next('.articlePrice').text() );
    }

    // js number format
    Number.prototype.format = function(n, x, s, c) {
        var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
           num = this.toFixed(Math.max(0, ~~n));
        return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
    };
    // js truncate
    String.prototype.trunc = String.prototype.trunc ||
        function(n){
            return (this.length > n) ? this.substr(0,n-1)+'&hellip;' : this;
    };

})(jQuery, window);
