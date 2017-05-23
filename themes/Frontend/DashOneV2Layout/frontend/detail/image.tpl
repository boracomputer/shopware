{extends file='parent:frontend/detail/image.tpl'}


{block name='frontend_detail_image_default_image_element'}

    {$alt = $sArticle.articleName|escape}

    {if $sArticle.image.description}
        {$alt = $sArticle.image.description|escape}
    {/if}
    {$sArticle|dump}
    <span class="image--element"
          {if $sArticle.image}
          data-img-large="//images.skillbooks.de/image800/{$sArticle.image.attribute.attribute1}"
          data-img-small="//images.skillbooks.de/image45/{$sArticle.image.attribute.attribute1}"
          data-img-original="//images.skillbooks.de/{$sArticle.image.attribute.attribute1}"
          {/if}
          data-alt="{$alt}">

        {block name='frontend_detail_image_default_image_media'}
            <span class="image--media">
                {if isset($sArticle.image.attribute)}
                    {block name='frontend_detail_image_default_picture_element'}
                        <img srcset="//images.skillbooks.de/image300/{$sArticle.image.attribute.attribute1}" alt="{$alt}" itemprop="image" />
                    {/block}
                {else}
                    {block name='frontend_detail_image_fallback'}
                        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                    {/block}
                {/if}
            </span>
        {/block}
    </span>
{/block}


{block name='frontend_detail_images_image_element'}

    {$alt = $sArticle.articleName|escape}

    {if $image.description}
        {$alt = $image.description|escape}
    {/if}

    <span class="image--element"
          data-img-large="//images.skillbooks.de/image800/{$image.attribute.attribute1}"
          data-img-small="//images.skillbooks.de/image45/{$image.attribute.attribute1}"
          data-img-original="//images.skillbooks.de/{$image.attribute.attribute1}"
          data-alt="{$alt}">

        {block name='frontend_detail_images_image_media'}
            <span class="image--media">
                {if isset($image.attribute)}
                    {block name='frontend_detail_images_picture_element'}
                        <img srcset="//images.skillbooks.de/image300/{$image.attribute.attribute1}" alt="{$alt}" itemprop="image" />
                    {/block}
                {else}
                    {block name='frontend_detail_images_fallback'}
                        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                    {/block}
                {/if}
            </span>
        {/block}
    </span>
{/block}
