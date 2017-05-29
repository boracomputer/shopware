{extends file="parent:frontend/listing/product-box/box-emotion.tpl"}

{block name='frontend_listing_box_article_image_picture'}
    {if $sArticle.image.attribute}

        {$baseSource = "//images.skillbooks.de/image600/{$sArticle.image.attribute.attribute1}"}

        {if $itemCols && $emotion.grid.cols && !$fixedImageSize}
            {$colSize = 100 / $emotion.grid.cols}
            {$itemSize = "{$itemCols * $colSize}vw"}
        {else}
            {$itemSize = "300px"}
        {/if}
        {$itemSize = "300px"}
        
        {$articleThumbnails=[1280, 600, 300]}
        {foreach $articleThumbnails as $i => $maxWidth}
            {$srcSet = "{if $i>0}{$srcSet}, {/if}//images.skillbooks.de/image{$maxWidth}/{$sArticle.image.attribute.attribute1} {$maxWidth}w"}

            {if $image.retinaSource}
                {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image.retinaSource} {$maxWidth}w"}
            {/if}
        {/foreach}

    {elseif $sArticle.image.source}
        {$baseSource = $sArticle.image.source}
    {else}
        {$baseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
    {/if}

    {$desc = $sArticle.articleName|escape}

    {if $sArticle.image.description}
        {$desc = $sArticle.image.description|escape}
    {/if}

    <picture>
        {if $srcSetRetina}<source sizes="(min-width: 48em) {$itemSize}, 100vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)" />{/if}
        {if $srcSet}<source sizes="(min-width: 48em) {$itemSize}, 100vw" srcset="{$srcSet}" />{/if}
        <img src="{$baseSource}" alt="{$desc}" title="{$desc|truncate:25:""}" />
    </picture>
{/block}

{*block name='frontend_listing_box_article_price_info' append}
    {include file="frontend/listing/product-box/product-buynow.tpl"}
{/block*}
