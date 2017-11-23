{extends file='parent:frontend/search/ajax.tpl'}

{block name="search_ajax_list_entry_media"}
<span class="entry--media block">
    {if $search_result.image.attribute}
        <img srcset="//images.skillbooks.de/image800/{$search_result.image.attribute.attribute1}" alt="{$search_result.name|escape}" class="media--image">
    {elseif $search_result.image.thumbnails[0]}
        <img srcset="{$search_result.image.thumbnails[0].sourceSet}" alt="{$search_result.name|escape}" class="media--image">
    {else}
        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{"{s name='ListingBoxNoPicture'}{/s}"|escape}" class="media--image">
    {/if}
</span>
{/block}

{* Product name *}
{block name="search_ajax_list_entry_name"}
    <span class="entry--name block">
        {$search_result.name|unescape}
    </span>
{/block}
