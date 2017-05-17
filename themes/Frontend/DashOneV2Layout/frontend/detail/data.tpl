{extends file='parent:frontend/detail/data.tpl'}

{block name='frontend_detail_data_price_default'}
    <span class="price--content content--default">
        <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
        {if $sArticle.priceStartingFrom && !$sArticle.liveshoppingData}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}
        {$price = ","|explode:$sArticle.price}
        {*<svg>
            <text dx=".08em" y="1.05em" class="shadow">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
            <text dx=".05em" y="1em" class="outline">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
            <text dx=".05em" y="1em" class="baseline">{$price.0},<tspan class="sup" dy="-.6em" dx="0">{$price.1}{s name="Star"}{/s}</tspan></text>
        </svg>*}
        {*s name="Star" namespace="frontend/listing/box_article"}{/s*}
        <span class="pricelayer shadow">{$price.0}<sup>{$price.1}</sup> &euro;</span>
        <span class="pricelayer outline">{$price.0}<sup>{$price.1}</sup> &euro;</span>
        <span class="pricelayer fill">{$price.0}<sup>{$price.1}</sup> &euro;</span>
    </span>
{/block}

{block name="frontend_detail_data_delivery"}
    {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
{/block}
