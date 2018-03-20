{namespace name="frontend/listing/get_category"}
{extends file='parent:widgets/listing/get_category.tpl'}

{block name="widgets_listing_get_category_categories_item"}
    {if $children.active}
        {if $children.attribute.disableshopid|intval === $Shop->getId() || $children.description=='hidden' || $category.description=='Tagesdeal' || ($children.articleCount===0 && $children.external=='')}
            {continue}
        {/if}
        <li class="navigation--entry" role="menuitem">
            {block name="widgets_listing_get_category_categories_item_link"}
                <a href="{$children.link}" title="{$children.name|escape}"
                   class="navigation--link{if $children.childrenCount} link--go-forward{/if}"
                   data-category-id="{$children.id}"
                   data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$children.id}}">

                    {block name="widgets_listing_get_category_categories_item_link_name"}
                        {$children.name}
                    {/block}

                    {block name="widgets_listing_get_category_categories_item_link_children"}
                        {if $children.childrenCount}
                            <span class="is--icon-right">
                                <i class="icon--arrow-right"></i>
                            </span>
                        {/if}
                    {/block}
                </a>
            {/block}
        </li>
    {/if}
{/block}
