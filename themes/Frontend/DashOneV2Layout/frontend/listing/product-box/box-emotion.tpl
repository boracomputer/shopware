{extends file="parent:frontend/listing/product-box/box-emotion.tpl"}

{block name='frontend_listing_box_article_image_picture'}

    {$desc = $sArticle.articleName|escape}

    {if $sArticle.image.description}
        {$desc = $sArticle.image.description|escape}
    {/if}

    {if $sArticle.image.attribute}

        {$baseSource = "//images.skillbooks.de/image600/{$sArticle.image.attribute.attribute1}"}

        {if $itemCols && $emotion.grid.cols && !$fixedImageSize}
            {$colSize = 100 / $emotion.grid.cols}
            {$itemSize = "{$itemCols * $colSize}vw"}
        {else}
            {$itemSize = "200px"}
        {/if}

        {foreach [1280, 600, 300] as $width}
            {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}//images.skillbooks.de/image{$width}/{$sArticle.image.attribute.attribute1} {$width}w"}
            {if $image.retinaSource}
                {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image.retinaSource} {$width}w"}
            {/if}
        {/foreach}

        <picture>
            {if $srcSetRetina}<source sizes="(min-width: 48em) {$itemSize}, 100vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)" />{/if}
            {if $srcSet}<source sizes="(min-width: 48em) {$itemSize}, 100vw" srcset="{$srcSet}" />{/if}
            <img src="{$baseSource}" alt="{$desc}" title="{$desc|truncate:25:""}" />
        </picture>

    {elseif $sArticle.image.thumbnails}

        {if $element.viewports && !$fixedImageSize}
            {foreach $element.viewports as $viewport}
                {$cols = ($viewport.endCol - $viewport.startCol) + 1}
                {$elementSize = $cols * $cellWidth}
                {$size = "{$elementSize}vw"}

                {if $breakpoints[$viewport.alias]}

                    {if $viewport.alias === 'xl' && !$emotionFullscreen}
                        {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                        {$size = "(min-width: {$baseWidth}px) {$size}"}
                    {else}
                        {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
                    {/if}
                {/if}

                {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
            {/foreach}
        {else}
            {$itemSize = "200px"}
        {/if}

        {$srcSet = ''}
        {$srcSetRetina = ''}

        {foreach $sArticle.image.thumbnails as $image}
            {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

            {if $image.retinaSource}
                {$srcSetRetina = "{if $srcSetRetina}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth * 2}w"}
            {/if}
        {/foreach}

        <picture>
            <source sizes="{$itemSize}" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)" />
            <source sizes="{$itemSize}" srcset="{$srcSet}" />

            <img src="{$sArticle.image.thumbnails[0].source}" alt="{$desc|strip_tags|truncate:160}" />
        </picture>

    {elseif $sArticle.image.source}
        <img src="{$sArticle.image.source}" alt="{$desc|strip_tags|truncate:160}" />
    {else}
        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc|strip_tags|truncate:160}" />
    {/if}

    {*elseif $sArticle.image.source}
        {$baseSource = $sArticle.image.source}
    {else}
        {$baseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
    {/if*}




{/block}

{*block name='frontend_listing_box_article_price_info' append}
    {include file="frontend/listing/product-box/product-buynow.tpl"}
{/block*}
