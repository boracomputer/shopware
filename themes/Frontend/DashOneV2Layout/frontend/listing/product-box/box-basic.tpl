{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* remove rating block *}
{block name='frontend_listing_box_article_rating'}
{/block}

{* Product description *}
{block name='frontend_listing_box_article_description'}
    <div class="product--description">
    {if $sArticle.ordernumber|strpos:"BW"!==false}
        {$sArticle.attr18|replace:"<hr />":""}
    {elseif $sArticle.description}
        {$sArticle.description|truncate:500}
    {elseif $sArticle.attr7}
        {$sArticle.attr7|strip_tags|truncate:"200":"&#x85;"}
    {/if}
    </div>
    <div class="product--ordernumber">
        Artnr.: {$sArticle.ordernumber}
    </div>
{/block}

{block name='frontend_listing_box_article_actions'}{/block}

{block name='frontend_listing_box_article_info_container' append}
{if $sArticle.ordernumber==323239}
<div class="alert is--error is--rounded">
    <div class="alert--icon">
        <i class="icon--element icon--cross"></i>
    </div>
    <div class="alert--content">SOLD OUT</div>
</div>
{else}
    {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
    <div class="clear"></div>
    {include file="frontend/listing/product-box/product-actions.tpl"}
    <div class="clear"></div>
{/if}
{/block}

{* Product name *}
{block name='frontend_listing_box_article_name'}
    <a href="{$sArticle.linkDetails}"
                class="product--title"
                title="{$sArticle.articleName|escapeHtml}">
        {$sArticle.articleName|unescape|truncate:90}
    </a>
{/block}
