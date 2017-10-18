{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* remove rating block *}
{block name='frontend_listing_box_article_rating'}
{/block}

{* Product description *}
{block name='frontend_listing_box_article_description'}
    <div class="product--description">
    {if $sArticle.ordernumber|strpos:"BW"!==false}
        {$sArticle.attr18}
    {elseif $sArticle.description}
        {$sArticle.description|strip_tags|truncate:500}
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
    {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
    <div class="clear"></div>
    {include file="frontend/listing/product-box/product-actions.tpl"}
    <div class="clear"></div>
{/block}

{* Product name *}
{block name='frontend_listing_box_article_name'}
    <a href="{$sArticle.linkDetails}"
                class="product--title"
                title="{$sArticle.articleName|escapeHtml}">
        {$sArticle.articleName|unescape|truncate:50}
    </a>
{/block}
