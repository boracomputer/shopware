
;(function($, window, undefined) {
    var a={};

    $(document).ready(function() {
        initItems();
        $('body').on('click', '.collapse--header', function(){
            if( $(this).next('.collapse--content').css('display')=='block' ){
                $(this).next('.collapse--content').slideUp();
            }else{
                $('.collapse--content').slideUp('fast', function(){
                    $('html, body').animate({
                            scrollTop: $(this).offset().top
                    }, 1000);
                });
                $(this).next('.collapse--content').slideDown();
            }
        });
        $('.konfigurator--group--item').on('click', 'input[type="radio"]', function(){
            updateGroup($(this));
            updateTotalPrice();
            // update caching
        });
    });

    function cacheConfigOptions(o){
        /*$.ajax({
            'dataType': 'jsonp',
            'url': '{/literal}{url controller="pckonfigurator" action="cacheKonfigurator"}{literal}',
            'data': {articles:JSON.stringify(a), configNr: {/literal}'{$sArticle.ordernumber}'{literal}},
            'complete': function (r) {
                if( o===1 ){
                    $.ajax({
                        'dataType': 'jsonp',
                        'url': '{/literal}{url controller="konfigurator" action="addConfigToBasket"}{literal}',
                        'data': {configNr: {/literal}'{$sArticle.ordernumber}'{literal}, price: loadOverviewPrice()},
                        'complete': function (result){
                            $('#modalLoading').modal('hide');
                            $('button.buyconfig').attr('disabled', '');
                            window.location.href = '{/literal}{url controller="checkout" action="cart"}{literal}';
                        }
                    });
                }
            }
        });*/
    }

    function initItems(){
        $('.item--input:checked').each(function(){
            updateGroup($(this));
        });
        updateTotalPrice();
    }

    function updateTotalPrice(){
        console.log(a);
        var t = 0;
        Object.keys(a).forEach(gId => {
            t += a[gId].price;
        });

        /*$('.item--input:checked').each(function(){
            t += parseFloat($(this).parent('label').parent('.konfigurator--group--item').attr('data-itemPrice'));
        });*/
        $('.konfigurator--footer .price').html( t.format(2, 3, '.', ',') + ' &euro;*' );
        return t.format(2, 3, '', '.');
    }

    function updateGroup( el ){
        var gId = el.parents('.konfigurator--group').attr('data-groupId');
        var aNr = el.val();
        var p = parseFloat(el.parents('.konfigurator--group--item').attr('data-itemprice'));
        a[gId] = { price: p, artnr: aNr, qty: 1 };

        updateGroupHeader(el);
    }

    function updateGroupHeader( el ){
        var h = el.parents('.collapse--content').first().prev('.collapse--header');
        h.find('.item-selected--name').text( el.next('.articleName').text().trunc(60) );
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
            return (this.length > n) ? this.substr(0,n-1)+'...' : this;
    };

})(jQuery, window);
