{extends file="parent:frontend/checkout/items/product.tpl"}

{block name='frontend_checkout_cart_item_delivery_informations' append}

    {if {config name=BasketShippingInfo} && $sBasketItem.shippinginfo}
        {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem.additional_details}
    {/if}

    {if $shopID != 3}
        <div class="product--delivery product--delivery-info delivery-info-stores">
            <span class="label">Filialbestand: </span>
            <a href="#" class="js--toggle-trigger" data-target="#stores--stock-{$sBasketItem.additional_details.stock.uniqid}">
                <span class="{$sBasketItem.additional_details.stock.textClass}">
                    <i class="{$sBasketItem.additional_details.stock.textIcon}"></i> {$sBasketItem.additional_details.stock.text}
                </span>
            </a>
        </div>
    {/if}
    
{/block}
