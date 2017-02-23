{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* show all quantities in this overlay *}
{block name="frontend_listing_box_article_info_container" append}
<div class="stores--stock js--toggle-target product--delivery" id="stores--stock-{$sArticle.stock.uniqid}">
    <div class="btn icon--cross is--small js--toggle-close"></div>
    {$api = $sArticle.attr2}
    {foreach $sArticle.attr1|json_decode:"true" as $storeId => $qty}
        {if $qty>0}
            {$stockIcon='fa fa-check'}
            {$stockClass="delivery--text-available"}
        {elseif $api=='B' || $api=='W'}
            {$stockIcon='fa fa-clock-o'}
            {$stockClass="delivery--text-available"}
        {else}
            {$stockIcon='fa fa-times'}
            {$stockClass=""}
        {/if}
        <ul class="{$class}">
            <li><i class="{$stockIcon}"></i> {$tbStores[$storeId].name|utf8_encode}</li>
        </ul>
    {/foreach}
</div>
{/block}

{* Filialbestand *}
{block name='frontend_widgets_delivery_infos' prepend}
<div class="product--delivery-info delivery-info-stores">
    <small>
        Filialbestand:<br />
        <a href="#" class="js--toggle-trigger product--delivery" data-target="#stores--stock-{$sArticle.stock.uniqid}">
            <span class="{$sArticle.stock.textClass}"><small>
                <i class="{$sArticle.stock.textIcon}"></i> {$sArticle.stock.text}
            </small></span>
        </a>
    </small>
</div>
{/block}
