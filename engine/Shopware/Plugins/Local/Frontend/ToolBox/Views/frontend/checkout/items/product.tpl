{extends file="parent:frontend/checkout/items/product.tpl"}

{block name='frontend_checkout_cart_item_delivery_informations_stores'}
<div class="product--delivery product--delivery-info delivery-info-stores">
    <span class="label">Filialbestand: </span>
    <a href="#" class="js--toggle-trigger" data-target="#stores--stock-{$sBasketItem.additional_details.stock.uniqid}">
        <span class="{$sBasketItem.additional_details.stock.textClass}">
            <i class="{$sBasketItem.additional_details.stock.textIcon}"></i> {$sBasketItem.additional_details.stock.text}
        </span>
    </a>
</div>
{/block}
