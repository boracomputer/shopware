{extends file='parent:frontend/checkout/items/product.tpl'}
{namespace name="frontend/checkout/cart_item"}

{block name="frontend_checkout_cart_item_image_container_inner"}
{$image = $sBasketItem.image}

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
    {$smarty.block.parent}
{else}
    <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" />
{/if}
{/block}

{block name='frontend_checkout_cart_item_details_inline'}{/block}
