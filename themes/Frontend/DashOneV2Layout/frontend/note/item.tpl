{extends file='parent:frontend/note/item.tpl'}

{* Article picture *}
{block name="frontend_note_item_image"}
    <div class="note--image-container">
        {$desc = $sBasketItem.articlename|escape}
        {if isset($sBasketItem.image.attribute)}
            {if $sBasketItem.image.description}
                {$desc = $sBasketItem.image.description|escape}
            {/if}
            <a href="{$detailLink}" title="{$sBasketItem.articlename|escape}" class="note--image-link">
                {block name='frontend_listing_box_article_image_picture_element'}
                    <img srcset="//images.skillbooks.de/image300/{$sBasketItem.image.attribute.attribute1}"
                         alt="{$desc}"
                         title="{$desc|truncate:25:""}" />
                {/block}
            </a>
            {* Zoom picture *}
            {block name="frontend_note_item_image_zoom"}{/block}
        {else}
            <a href="{$detailLink}" title="{$sBasketItem.articlename|escape}" class="note--image-link">
                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" class="note--image" />
            </a>
        {/if}
    </div>
{/block}

{block name="frontend_note_item_actions_buy"}

<form name="sAddToBasket" method="post" action="{url controller='checkout' action='addArticle'}" class="buybox--form float--right" data-add-article="true" data-eventname="submit" data-showmodal="false" data-addarticleurl="{url controller='checkout' action='ajaxAddArticleCart'}">
    <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}">
    <input type="hidden" name="sQuantity" value="1">
    <button class="buybox--button btn action--to-basket is--primary is--icon-right is--full is--small float--left" name="{s name='ButtonToBasket'}In den Warenkorb{/s}">
        {s name='ButtonToBasket'}In den Warenkorb{/s} <i class="icon--arrow-right"></i>
    </button>
</form>

{/block}
