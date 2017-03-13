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

{block name='frontend_detail_index_data' prepend}

    <div class="base-info--entry entry--sku panel has--border">
        <div class="panel--body is--wide">
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
            <hr />
            {block name="frontend_detail_data_delivery"}
                {* Delivery informations *}
                {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
                    {include file="frontend/plugins/index/delivery_informations_detail.tpl" sArticle=$sArticle}
                {/if}
            {/block}
        </div>
    </div>

    {* Unit price *}
    {if $sArticle.purchaseunit}
        <div class='product--price price--unit'>

            {* Unit price label *}
            {block name='frontend_detail_data_price_unit_label'}
                <span class="price--label label--purchase-unit">
					{s name="DetailDataInfoContent" namespace='frontend/detail/data'}{/s}
				</span>
            {/block}

            {* Unit price content *}
            {block name='frontend_detail_data_price_unit_content'}
                {$sArticle.purchaseunit} {$sArticle.sUnit.description}
            {/block}

            {* Unit price is based on a reference unit *}
            {if $sArticle.purchaseunit && $sArticle.purchaseunit != $sArticle.referenceunit}
                {* Reference unit price content *}
                {block name='frontend_detail_data_price_unit_reference_content'}
                    ({$sArticle.referenceprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                    / {$sArticle.referenceunit} {$sArticle.sUnit.description})
                {/block}
            {/if}
        </div>
    {/if}
{/block}
