{extends file="parent:frontend/listing/product-box/product-actions.tpl"}

{block name='frontend_listing_box_article_actions_save' append}
{if ($shopID == 1 || $shopID == 5)}
<div class="float--left">
    <a class="btn is--small product--action btn action--storesstock js--toggle-trigger" data-target="#stores--stock-{$sArticle.stock.uniqid}" href="#" title="{s name='storesstock'}Filialbestände anzeigen{/s}">
        <i class="fa fa-home"></i>{if $sArticle.stock.inStores>0}<span class="badge is--secondary">{$sArticle.stock.inStores}</span>{/if}
    </a>
</div>
{/if}
{/block}
