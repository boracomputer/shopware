{namespace name="frontend/checkout/cart_item"}

<div class="table--tr block-group row--product{if $isLast} is--last-row{/if}" style="{if $sBasketItem.id|in_array:$basketFalseStock}background-color:#FCC; border-bottom: 1px solid #FAA;{/if}">

    {if $sBasketItem.additional_details.sConfigurator}
        {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber forceSecure}}
    {else}
        {$detailLink=$sBasketItem.linkDetails}
    {/if}

    {* Product information column *}
    {block name='frontend_checkout_cart_item_name'}
        <div class="column--product">

            {* Product image *}
            {block name='frontend_checkout_cart_item_image'}
                <div class="panel--td column--image">
                    <div class="table--media">
                        {block name="frontend_checkout_cart_item_image_container"}
                            <div class="table--media-outer">
                                {block name="frontend_checkout_cart_item_image_container_outer"}
                                    <div class="table--media-inner">
                                        {block name="frontend_checkout_cart_item_image_container_inner"}

                                            {$image = $sBasketItem.additional_details.image}
                                            {$desc = $sBasketItem.articlename|escape}
                                            {if $image.attribute}
                                                {if $sBasketItem.additional_details.sConfigurator}
                                                    {$detailLink={url controller=detail sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber forceSecure}}
                                                {elseif $sBasketItem.ordernumber|strpos:"PCK"!==false}
                                                    {$params = "."|explode:$sBasketItem.ordernumber}
                                                    {$detailLink={url controller=pckonfigurator action=configure id=$params[1] uId=$params[2]}}
                                                {else}
                                                    {$detailLink=$sBasketItem.linkDetails}
                                                {/if}

                                                {$desc = $sBasketItem.articlename|escape}

                                                <a href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags}" class="table--media-link"
                                                    {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                                                    data-modalbox="true"
                                                    data-content="{url controller="detail" action="productQuickView" ordernumber="{$sBasketItem.ordernumber}" fullPath forceSecure}"
                                                    data-mode="ajax"
                                                    data-width="750"
                                                    data-sizing="content"
                                                    data-title="{$sBasketItem.articlename|strip_tags|escape}"
                                                    data-updateImages="true"
                                                    {/if}>
                                                        {if $image.description}
                                                            {$desc = $image.description|escape}
                                                        {/if}
                                                        <img srcset="//images.skillbooks.de/image105/{$image.attribute.attribute1}" alt="{$desc}" title="{$desc|truncate:160}" />
                                                </a>

                                            {elseif $image.thumbnails[0]}
                                                <a href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags}" class="table--media-link"
                                                    {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                                                   data-modalbox="true"
                                                   data-content="{url controller="detail" action="productQuickView" ordernumber="{$sBasketItem.ordernumber}" fullPath forceSecure}"
                                                   data-mode="ajax"
                                                   data-width="750"
                                                   data-sizing="content"
                                                   data-title="{$sBasketItem.articlename|strip_tags|escape}"
                                                   data-updateImages="true"
                                                   {/if}>

                                                    {if $image.description}
                                                        {$desc = $image.description|escape}
                                                    {/if}

                                                    <img srcset="{$image.thumbnails[0].sourceSet}" alt="{$desc}" title="{$desc|truncate:160}" />
                                                </a>
                                            {else}
                                                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" />
                                            {/if}
                                        {/block}
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    </div>
                </div>
            {/block}

            {* Product information *}
            {block name='frontend_checkout_cart_item_details'}
                <div class="panel--td table--content">

                    {* Product name *}
                    {block name='frontend_checkout_cart_item_details_title'}

                        <a class="content--title" href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags|escape}"
                            {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                               data-modalbox="true"
                               data-content="{url controller="detail" action="productQuickView" ordernumber="{$sBasketItem.ordernumber}" fullPath forceSecure}"
                               data-mode="ajax"
                               data-width="750"
                               data-sizing="content"
                               data-title="{$sBasketItem.articlename|strip_tags|escape}"
                               data-updateImages="true"
                            {/if}>
                            {$sBasketItem.articlename|strip_tags|truncate:60}
                        </a>
                    {/block}

                    {* Product SKU number *}
                    {block name='frontend_checkout_cart_item_details_sku'}
                        <p class="content--sku content">
                            {s name="CartItemInfoId"}{/s} {$sBasketItem.ordernumber}
                        </p>
                    {/block}

                    {* Product delivery information *}
                    {block name='frontend_checkout_cart_item_delivery_informations'}
                        {if {config name=BasketShippingInfo} && $sBasketItem.shippinginfo}
                            {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem.additional_details}
                        {/if}
                    {/block}

                    {* Additional product information *}
                    {block name='frontend_checkout_cart_item_details_inline'}{/block}
                </div>
            {/block}
        </div>
    {/block}

    {* Product quantity *}
    {block name='frontend_checkout_cart_item_quantity'}
        <div class="panel--td column--quantity is--align-right" style="{if $sBasketItem.id|in_array:$basketFalseStock}padding-top: 10px;{/if}">
            {if $sBasketItem.id|in_array:$basketFalseStock}
                <p style="line-height:1.2em;"><small><strong>
                    {if $sBasketItem.additional_details.attr13|intval > 0}
                        Nur {$sBasketItem.additional_details.attr13} Stück lagernd
                    {else}
                        nicht lagernd
                    {/if}
                </strong></small></p>
            {/if}

            {* Label *}
            {block name='frontend_checkout_cart_item_quantity_label'}
                <div class="column--label quantity--label">
                    {s name="CartColumnQuantity" namespace="frontend/checkout/cart_header"}{/s}
                </div>
            {/block}

            {block name='frontend_checkout_cart_item_quantity_selection'}
                {if !$sBasketItem.additional_details.laststock || ($sBasketItem.additional_details.laststock && $sBasketItem.additional_details.instock > 0)}
                    <form name="basket_change_quantity{$sBasketItem.id}" method="post" action="{url action='changeQuantity' sTargetAction=$sTargetAction}">
                        <select name="sQuantity" data-auto-submit="true">
                            {section name="i" start=$sBasketItem.minpurchase loop=$sBasketItem.maxpurchase+1 step=$sBasketItem.purchasesteps}
                                <option value="{$smarty.section.i.index}" {if $smarty.section.i.index==$sBasketItem.quantity}selected="selected"{/if}>
                                    {$smarty.section.i.index}
                                </option>
                            {/section}
                        </select>
                        <input type="hidden" name="sArticle" value="{$sBasketItem.id}" />
                    </form>
                {else}
                    {s name="CartColumnQuantityEmpty" namespace="frontend/checkout/cart_item"}{/s}
                {/if}
            {/block}
        </div>
    {/block}

    {* Product unit price *}
    {block name='frontend_checkout_cart_item_price'}
        <div class="panel--td column--unit-price is--align-right">

            {if !$sBasketItem.modus}
                {block name='frontend_checkout_cart_item_unit_price_label'}
                    <div class="column--label unit-price--label">
                        {s name="CartColumnPrice" namespace="frontend/checkout/cart_header"}{/s}
                    </div>
                {/block}

                {$sBasketItem.price|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
            {/if}
        </div>
    {/block}

    {* Product tax rate *}
    {block name='frontend_checkout_cart_item_tax_price'}{/block}

    {* Accumulated product price *}
    {block name='frontend_checkout_cart_item_total_sum'}
        <div class="panel--td column--total-price is--align-right">
            {block name='frontend_checkout_cart_item_total_price_label'}
                <div class="column--label total-price--label">
                    {s name="CartColumnTotal" namespace="frontend/checkout/cart_header"}{/s}
                </div>
            {/block}
            {$sBasketItem.amount|currency}{block name='frontend_checkout_cart_tax_symbol'}{s name="Star" namespace="frontend/listing/box_article"}{/s}{/block}
        </div>
    {/block}

    {* Remove product from basket *}
    {block name='frontend_checkout_cart_item_delete_article'}
        <div class="panel--td column--actions">
            <form action="{url action='deleteArticle' sDelete=$sBasketItem.id sTargetAction=$sTargetAction}"
                  method="post">
                <button type="submit" class="btn is--small column--actions-link"
                        title="{"{s name='CartItemLinkDelete'}{/s}"|escape}">
                    <i class="icon--cross"></i>
                </button>
            </form>
        </div>
    {/block}
</div>
