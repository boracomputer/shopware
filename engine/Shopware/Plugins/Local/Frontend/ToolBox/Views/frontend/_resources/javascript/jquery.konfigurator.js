
;(function($, window, undefined) {
    var c={}; var i; var uId; var cId;

    $(document).ready(function() {
        initItems();
        uId = $('.container--konfigurator').attr('data-uID');
        cId = $('.container--konfigurator').attr('data-cID');

        $('body').on('click', '.collapse--header', function(e){

            var t = $(this);
            var n = t.next('.collapse--content');

            if( n.css('display')=='block' ){
                n.slideUp();
            }else{
                $('.collapse--content').slideUp('fast', function(){
                });
                n.slideDown('fast', function(){
                    $('html, body').animate({
                        scrollTop: t.offset().top
                    }, 'fast');
                });
            }
            e.preventDefault();
        });

        $('.container--konfigurator').on('click', '.action--quickview', function(){
            i = $(this).parents('.konfigurator--group--item').find('input.item--input');
        });

        $('.container--konfigurator').on('click', '.action--quickview', function(e){
            e.preventDefault();
            var t = $(this);
            $.loadingIndicator.open();
            $.ajax({
                url: t.attr('href'),
                success: function (data) {
                    $.loadingIndicator.close();
                        var $d = $('<div/>', {
                            html: data
                        });
                        $.modal.open( $d, {
                            width: 800,
                            title: t.attr('data-title'),
                        });
                        $d.find('.konfigurator--select-item').click(function(){
                            $.modal.close();
                            i.parents('.konfigurator--group').find('input').attr('checked', false)
                            i.attr('checked', 'checked');
                            i.prop("checked", true);
                            updateItem(i);
                        });
                }
            });
        });

        $('.container--konfigurator').on('click', '.buybox--button-konfigurator', function(e){
            e.preventDefault();
            $.ajax({
                'dataType': 'jsonp',
                'url': '/pckonfigurator/basket',
                'data': { articles: JSON.stringify(c), uID: uId, cID: cId },
                'complete': function (artnr) {
                    console.log(artnr);
                    /*var b = $('<button/>', {
                        'data-addArticleUrl': '/checkout/addArticle/sAdd/'+artnr
                    });
                    b.swAddArticle();
                    b.trigger('click');*/
                }
            });
        });

        $('.konfigurator--group--item').on('click', 'input[type="radio"]', function(){
            updateItem($(this));
            // update caching
        });
    });

    function cacheConfigOptions(){
        $.ajax({
            'dataType': 'jsonp',
            'url': '/pckonfigurator/cache',
            'data': { articles: JSON.stringify(c), uID: uId, cID: cId },
            'complete': function (r) {
                //window.location.href = '{/literal}{url controller="checkout" action="cart"}{literal}';
            }
        });
    }

    function initItems(){
        $('.item--input:checked').each(function(){
            updateGroup($(this));
        });
        updateTotalPrice();
    }
    function updateItem( el ){
        updateGroup( el );
        updateTotalPrice();
        cacheConfigOptions();
    }
    function updateTotalPrice(){
        var t = 0;
        Object.keys(c).forEach(gId => {
            t += c[gId].price;
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
        c[gId] = { price: p, artnr: aNr, qty: 1 };

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
