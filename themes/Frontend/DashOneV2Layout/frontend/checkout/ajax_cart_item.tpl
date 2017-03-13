{extends file='parent:frontend/checkout/ajax_cart_item.tpl'}


{block name='frontend_checkout_ajax_cart_articleimage_product'}

{if $basketItem.modus == $IS_PRODUCT || $basketItem.modus == $IS_PREMIUM_PRODUCT}
    {$desc = $basketItem.articlename|escape}
    {if $basketItem.image.attribute}
        <img src="//images.skillbooks.de/image300/{$basketItem.image.attribute.attribute1}" alt="{$desc}" title="{$desc|truncate:160}" class="thumbnail--image" />
    {else}
        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" class="thumbnail--image" />
    {/if}
{/if}

{/block}
