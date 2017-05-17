{extends file='parent:frontend/detail/index.tpl'}

{block name="frontend_index_header_javascript_jquery" append}
{if $shopID != 3}
<script>
    jQuery(document).ready(function($) {
        window.controller['stores_getStockAjax'] = '{url controller="Filiale" action="getStockAjax"}';
        $('#get-stock').on('click', function(event) {
            event.preventDefault();
            $.overlay.open({
                'closeOnClick': false
            });
            $.loadingIndicator.open({
                'openOverlay': false
            });
            $.ajax({
                'url': window.controller['stores_getStockAjax'],
                'data': { ordernumber: {$sArticle.ordernumber} },
                'success': function( result ){
                    $.loadingIndicator.close(function () {
                        $.modal.open(result, {
                            sizing: 'content',
                            title: 'Filialbestände'
                        });
                    });
                },
                'error': function( result ){
                    $.loadingIndicator.close(function () {
                    });
                }
            });
            return false;
        });
    });
</script>
{/if}
{/block}
