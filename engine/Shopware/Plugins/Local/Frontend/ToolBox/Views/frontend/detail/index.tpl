{extends file='parent:frontend/detail/index.tpl'}

{block name="frontend_index_javascript_async_ready" append}
{if $shopID != 3 && !$isKonfigurator}
<script>
    document.asyncReady(function() {
        window.controller['stores_getStockAjax'] = '{url controller="Filiale" action="getStockAjax"}';
        $('#get-stock').on('click', function(event) {
            event.preventDefault();

            $.loadingIndicator.open({
                'openOverlay': false
            });
            $.ajax({
                'url': window.controller['stores_getStockAjax'],
                'data': { ordernumber: {$sArticle.ordernumber}, articleId: {$sArticle.articleId} },
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
        <div class="delivery--information delivery--information-sdd">
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
    {/if}
    {/block}
{/block}

{block name="frontend_detail_index_actions" append}
    {if $marketingAktionen|count>0}
        <hr />
        {foreach $marketingAktionen as $aktion}
            {if $aktion.banner_small}
                <a href="{url controller=aktion action=index aktion=$aktion.slug1}">
                    <img src="{$aktion.banner_small}" />
                </a>
            {/if}
        {/foreach}
    {/if}
{/block}
