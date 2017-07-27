{extends file="parent:frontend/listing/product-box/product-badges.tpl"}
{namespace name="frontend/listing/box_article"}

{block name='frontend_listing_box_article_discount' append}

{if $sArticle.attr8|count>1}
    <div class="product--badge badge--ecolabel modal--size-table" style="background: {$sArticle.attr8.color}" data-content="<img src='//ecolabel.skillbooks.de/{$sArticle.ordernumber}-{if $Shop->getId()==1}bora{elseif $Shop->getId()==3}schwan{elseif $Shop->getId()==5}km{else}blank{/if}.png'>" data-modalbox="true" data-targetSelector="a" data-width="284" data-height="596" data-title="Energielabel">
        <a href="#" title="Energieeffizienzklasse" data-title="">
            {$sArticle.attr8.class}
        </a>
    </div>
{/if}
{/block}
