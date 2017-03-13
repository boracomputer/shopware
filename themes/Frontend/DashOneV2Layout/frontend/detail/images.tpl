{extends file='parent:frontend/detail/images.tpl'}

{block name='frontend_detail_image_thumbnail_items'}

    {* Thumbnail - Main image *}
    {if $sArticle.image.attribute}

        {$alt = $sArticle.articleName|escape}

        {if $sArticle.image.description}
            {$alt = $sArticle.image.description|escape}
        {/if}

        <a href="//images.skillbooks.de/image800/{$sArticle.image.attribute.attribute1}"
           title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
           class="thumbnail--link is--active">
            {block name='frontend_detail_image_thumbs_main_img'}
                <img srcset="//images.skillbooks.de/image45/{$sArticle.image.attribute.attribute1}"
                     alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
                     title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:25:""}"
                     class="thumbnail--image" />
            {/block}
        </a>
    {/if}

    {* Thumbnails *}
    {foreach $sArticle.images as $image}
        {if $image.attribute}
            {block name='frontend_detail_image_thumbnail_images'}
                {$alt = $sArticle.articleName|escape}

                {if $image.description}
                    {$alt = $image.description|escape}
                {/if}

                <a href="//images.skillbooks.de/image800/{$image.attribute.attribute1}"
                   title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
                   class="thumbnail--link">
                    {block name='frontend_detail_image_thumbs_images_img'}
                        <img srcset="//images.skillbooks.de/image45/{$image.attribute.attribute1}"
                             alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
                             title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:25:""}"
                             class="thumbnail--image" />
                    {/block}
                </a>
            {/block}
        {/if}
    {/foreach}
{/block}
