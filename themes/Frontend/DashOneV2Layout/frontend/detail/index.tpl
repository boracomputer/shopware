{extends file='parent:frontend/detail/index.tpl'}

{block name='frontend_detail_index_image_container'}
    <div class="product--image-container image-slider{if $sArticle.image.attribute && {config name=sUSEZOOMPLUS}} product--image-zoom{/if}"
        {if $sArticle.image}
         data-image-slider="true"
         data-image-gallery="true"
         data-maxZoom="{$theme.lightboxZoomFactor}"
         data-thumbnails=".image--thumbnails"
        {/if}>
        {include file="frontend/detail/image.tpl"}
    </div>
{/block}

{* Product attribute 1 *}
{block name='frontend_detail_data_attributes_attr1'}
{/block}
{block name='frontend_detail_data_attributes_attr2'}
{/block}

{block name='frontend_detail_index_buy_container_inner' prepend}

{/block}

{block name='frontend_detail_index_buy_container'}

<div class="product--buybox block{if $sArticle.sConfigurator && $sArticle.sConfiguratorSettings.type==2} is--wide{/if}">
    <div class="panel has--border">
        <div class="panel--body is--wide">
            {block name="frontend_detail_rich_snippets_brand"}
                <meta itemprop="brand" content="{$sArticle.supplierName|escape}"/>
            {/block}

            {block name="frontend_detail_rich_snippets_weight"}
                {if $sArticle.weight}
                    <meta itemprop="weight" content="{$sArticle.weight} kg"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_height"}
                {if $sArticle.height}
                    <meta itemprop="height" content="{$sArticle.height} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_width"}
                {if $sArticle.width}
                    <meta itemprop="width" content="{$sArticle.width} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_depth"}
                {if $sArticle.length}
                    <meta itemprop="depth" content="{$sArticle.length} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_release_date"}
                {if $sArticle.sReleasedate}
                    <meta itemprop="releaseDate" content="{$sArticle.sReleasedate}"/>
                {/if}
            {/block}

            {block name='frontend_detail_buy_laststock'}
                {if !$sArticle.isAvailable && ($sArticle.isSelectionSpecified || !$sArticle.sConfigurator)}
                    {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailBuyInfoNotAvailable' namespace='frontend/detail/buy'}{/s}"}
                {/if}
            {/block}

            {* Product email notification *}
            {block name="frontend_detail_index_notification"}
                {if $sArticle.notification && $sArticle.instock <= 0 && $ShowNotification}
                    {include file="frontend/plugins/notification/index.tpl"}
                {/if}
            {/block}

            <div itemprop="offers" itemscope itemtype="{if $sArticle.sBlockPrices}http://schema.org/AggregateOffer{else}http://schema.org/Offer{/if}" class="buybox--inner">

                {block name='frontend_detail_index_data'}
                    {if $sArticle.sBlockPrices}
                        {$lowestPrice=false}
                        {$highestPrice=false}
                        {foreach $sArticle.sBlockPrices as $blockPrice}
                            {if $lowestPrice === false || $blockPrice.price < $lowestPrice}
                                {$lowestPrice=$blockPrice.price}
                            {/if}
                            {if $highestPrice === false || $blockPrice.price > $highestPrice}
                                {$highestPrice=$blockPrice.price}
                            {/if}
                        {/foreach}

                        <meta itemprop="lowPrice" content="{$lowestPrice}" />
                        <meta itemprop="highPrice" content="{$highestPrice}" />
                        <meta itemprop="offerCount" content="{$sArticle.sBlockPrices|count}" />
                    {else}
                        <meta itemprop="priceCurrency" content="{$Shop->getCurrency()->getCurrency()}"/>
                    {/if}
                    {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
                {/block}

                {block name='frontend_detail_index_after_data'}{/block}

                {* Configurator drop down menu's *}
                {block name="frontend_detail_index_configurator"}
                    <div class="product--configurator">
                        {if $sArticle.sConfigurator}
                            {if $sArticle.sConfiguratorSettings.type == 1}
                                {include file="frontend/detail/config_step.tpl"}
                            {elseif $sArticle.sConfiguratorSettings.type == 2}
                                {include file="frontend/detail/config_variant.tpl"}
                            {else}
                                {include file="frontend/detail/config_upprice.tpl"}
                            {/if}
                        {/if}
                    </div>
                {/block}

                <hr />

                {* Delivery Informations *}
                <div class="product--delivery_info">
                {block name="frontend_detail_data_delivery"}
                    {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
                        {include file="frontend/plugins/index/delivery_informations_detail.tpl" sArticle=$sArticle}
                    {/if}
                {/block}
                </div>
                <hr />

                {* Include buy button and quantity box *}
                {block name="frontend_detail_index_buybox"}
                    {include file="frontend/detail/buy.tpl"}
                {/block}

            </div>

            {* Product data *}
            {block name='frontend_detail_index_buy_container_inner'}
            <div class="product--base-info">
                <hr />
                <strong class="entry--label">
                    {s name="DetailDataId" namespace="frontend/detail/data"}{/s}
                </strong>
                <span class="entry--content">{$sArticle.ordernumber}</span>
                <br>
                <strong class="entry--label">
                    {s name="DetailDataSupplier" namespace="frontend/detail/data"}Hersteller:{/s}
                </strong>
                <span class="entry--content">{$sArticle.supplierName}</span>
                <br>
                <strong class="entry--label">
                    {s name="DetailDataSupplierNumber" namespace="frontend/detail/data"}Hersteller-Nr:{/s}
                </strong>
                <span class="entry--content">{$sArticle.suppliernumber}</span>
                <br>
                <strong class="entry--label">
                    {s name="DetailDataEAN" namespace="frontend/detail/data"}EAN:{/s}
                </strong>
                <span class="entry--content">{$sArticle.ean}</span>
            </div>
                <hr />

                {* Product actions *}
                {block name="frontend_detail_index_actions"}
                    <nav class="product--actions">
                        {include file="frontend/detail/actions.tpl"}
                    </nav>
                {/block}

            {/block}

            {* Product - Base information *}
            {block name='frontend_detail_index_buy_container_base_info'}
            {/block}
        </div>
    </div>
</div>
{/block}
