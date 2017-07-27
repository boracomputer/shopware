{extends file='parent:frontend/detail/index.tpl'}

{block name="frontend_index_header_javascript_jquery" append}
{if $shopID != 3 && !$isKonfigurator}
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

{block name="frontend_detail_index_delivery"}
    {$smarty.block.parent}
    {block name="frontend_detail_index_delivery_stores"}
    {if $shopID != 3}
        <div class="product--delivery">
            <div class="delivery--information delivery--information-stores">
                <strong class="entry--label">
                    Filialbestand:
                </strong>
                <span class="entry--content">
                <a href="#" class="js--toggle-trigger" id="get-stock">
                    <span class="{$sArticle.stock.textClass}">
                        <i class="{$sArticle.stock.textIcon}"></i> {$sArticle.stock.text}
                    </span>
                </a>
                </span>
            </div>
        </div>
    {/if}
    {/block}
{/block}
