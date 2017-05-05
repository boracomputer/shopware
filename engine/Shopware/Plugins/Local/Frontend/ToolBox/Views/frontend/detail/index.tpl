{extends file='parent:frontend/detail/index.tpl'}

{block name="frontend_index_header_javascript_jquery" append}
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
{/block}

{block name="frontend_detail_data_delivery" append}
    <br />
    <strong class="entry--label">
        Filialbestand:
    </strong>
    <span class="entry--content">
        <a href="#" class="js--toggle-trigger product--delivery" id="get-stock">
            <span class="{$sArticle.stock.textClass}">
                <i class="{$sArticle.stock.textIcon}"></i> {$sArticle.stock.text}
            </span>
        </a>
    </span>
{/block}
