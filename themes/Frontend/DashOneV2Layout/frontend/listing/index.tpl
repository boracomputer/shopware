{extends file='parent:frontend/listing/index.tpl'}

{block name="frontend_listing_index_tagcloud"}
    FOO:
    <pre>{$sCategoryContent|print_r}</pre>
    {$sCategoryContent.attribute3}
{/block}
