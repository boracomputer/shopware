{extends file="parent:frontend/listing/product-box/product-badges.tpl"}
{namespace name="frontend/listing/box_article"}

{block name='frontend_listing_box_article_discount' append}
{if $smarty.get.d==1}
{$sArticle.attr8|dump}
{if $sArticle.attr8|count>1}

    <div class="eei_class product--badge badge--discount" style="background: {$sArticle.attr8.color}">
        <a href="//ecolabel.skillbooks.de/{$sArticle.ordernumber}-{if $shopID==1}bora{elseif $shopID==3}schwan{elseif $shopID==5}km{/if}.png" title="Energieeffizienzklasse" data-title="" data-toggle="lightbox">
            {$sArticle.attr8.class}
        </a>
    </div>
{/if}
{/if}
{/block}
