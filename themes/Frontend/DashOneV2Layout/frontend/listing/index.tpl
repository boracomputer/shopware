{extends file='parent:frontend/listing/index.tpl'}

{block name="frontend_listing_index_tagcloud"}
    {$sCategoryContent.attribute.attribute3}
{/block}

{block name="frontend_listing_index_topseller"}
    {if !$hasEmotion && {config name=topSellerActive} && !$sCategoryContent.attribute.hidetopseller}
        {action module=widgets controller=listing action=top_seller sCategory=$sCategoryContent.id}
    {/if}
{/block}
