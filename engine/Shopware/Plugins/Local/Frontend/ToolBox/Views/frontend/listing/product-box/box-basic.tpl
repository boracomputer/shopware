{extends file="parent:frontend/listing/product-box/box-basic.tpl"}

{* show all quantities in this overlay *}
{block name="frontend_listing_box_article_info_container" append}
{if $shopID != 3}
    <div class="stores--stock js--toggle-target product--delivery" id="stores--stock-{$sArticle.stock.uniqid}">
        <div class="btn icon--cross is--small js--toggle-close"></div>
        <ul>
        {foreach $sArticle.stock.stockStoresDetail as $storeId => $options}
            {if $storeId==32 || $storeId==33}{continue}{/if}
            <li class="{$options.textClass}"><i class="{$options.textIcon}"></i> {$tbStores[$storeId].name|utf8_encode}</li>
        {/foreach}
        </ul>
    </div>
{/if}
{/block}

{* Filialbestand *}
{block name='frontend_widgets_delivery_infos' append}
{if $shopID != 3}
    <div class="product--delivery product--delivery-info delivery-info-stores">
        <span class="label">Filialbestand: </span>
        <a href="#" class="js--toggle-trigger" data-target="#stores--stock-{$sArticle.stock.uniqid}">
            <span class="{$sArticle.stock.textClass}">
                <i class="{$sArticle.stock.textIcon}"></i> {$sArticle.stock.text}
            </span>
        </a>
    </div>
{/if}
{/block}
