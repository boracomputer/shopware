{extends file='parent:frontend/detail/data.tpl'}

{block name='frontend_detail_data_price_default'}
    <span class="price--content content--default">
        <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
        {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}
        {$price = ","|explode:$sArticle.price}
        <svg>
            <text dx=".08em" y="1.05em" class="shadow">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
            <text dx=".05em" y="1em" class="outline">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
            <text dx=".05em" y="1em" class="baseline">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
        </svg>
        {*s name="Star" namespace="frontend/listing/box_article"}{/s*}
    </span>
{/block}

{block name="frontend_detail_data_delivery"}
<div class="base-info--entry entry--sku panel has--border">
    <div class="panel--body is--wide">
        {block name="frontend_detail_data_delivery_start"}{/block}
        {* Delivery informations *}
        {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
            {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
        {/if}
        {block name="frontend_detail_data_delivery_end"}{/block}
    </div>
</div>
{/block}
