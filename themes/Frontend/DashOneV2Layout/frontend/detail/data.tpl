{extends file='parent:frontend/detail/data.tpl'}

{*block name='frontend_detail_data_price_default'}
    <span class="price--content content--default">
        <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
        {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}
        {$price = ","|explode:$sArticle.price}
        <span class="pricelayer shadow">{$price.0}<sup>{$price.1}</sup> &euro;</span>
        <span class="pricelayer outline">{$price.0}<sup>{$price.1}</sup> &euro;</span>
        <span class="pricelayer fill">{$price.0}<sup>{$price.1}</sup> &euro;</span>
    </span>
{/block*}

{block name="frontend_detail_data_delivery"}
{/block}
