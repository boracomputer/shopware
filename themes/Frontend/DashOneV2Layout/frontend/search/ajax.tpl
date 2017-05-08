{extends file='parent:frontend/search/ajax.tpl'}

{block name="search_ajax_list_entry_media"}
<span class="entry--media block">
    {if $search_result.image}
        <img srcset="//images.skillbooks.de/image800/{$search_result.image.attribute.attribute1}" alt="{$search_result.name|escape}" class="media--image">
    {else}
        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{"{s name='ListingBoxNoPicture'}{/s}"|escape}" class="media--image">
    {/if}
</span>
{/block}