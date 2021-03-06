{* Product image - uses the picture element for responsive retina images. *}
<a href="{$sArticle.linkDetails}"
   title="{$sArticle.articleName|escape}"
   class="product--image">
    {block name='frontend_listing_box_article_image_element'}
        <span class="image--element">
            {block name='frontend_listing_box_article_image_media'}
                <span class="image--media">

                    {$desc = $sArticle.articleName|escape}

                    {if isset($sArticle.image.attribute) && $sArticle.image.attribute|count>0}

                        {if $sArticle.image.description}
                            {$desc = $sArticle.image.description|escape}
                        {/if}

                        {block name='frontend_listing_box_article_image_picture_element'}
                            <img srcset="//images.skillbooks.de/image300/{$sArticle.image.attribute.attribute1}"
                                 alt="{$desc}"
                                 title="{$desc|truncate:25:""}" />
                        {/block}

                    {elseif isset($sArticle.image.thumbnails)}

                        {if $sArticle.image.description}
                            {$desc = $sArticle.image.description|escape}
                        {/if}

                        {block name='frontend_listing_box_article_image_picture_element'}
                            <img srcset="{$sArticle.image.thumbnails[0].sourceSet}"
                                 alt="{$desc}"
                                 title="{$desc|truncate:160}" />
                        {/block}

                    {else}
                        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}"
                             alt="{$desc}"
                             title="{$desc|truncate:25:""}" />
                    {/if}
                </span>
            {/block}
        </span>
    {/block}
</a>
