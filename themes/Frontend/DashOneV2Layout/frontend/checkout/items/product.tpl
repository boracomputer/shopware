{extends file='parent:frontend/checkout/items/product.tpl'}

{block name="frontend_checkout_cart_item_image_container_inner"}

    {$image = $sBasketItem.additional_details.image}
    {$desc = $sBasketItem.articlename|escape}

    {if $image.attribute}
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
            <img srcset="//images.skillbooks.de/image105/{image.attribute.attribute1}" alt="{$desc}" title="{$desc|truncate:160}" />
        </a>
    {else}
        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" />
    {/if}
{/block}
