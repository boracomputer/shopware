{extends file='parent:frontend/search/fuzzy.tpl'}

{*block name="frontend_search_results"}
    {$facets=[]}
    <div class="search--results">
        {include file='frontend/listing/listing.tpl'}
    </div>
{/block*}
