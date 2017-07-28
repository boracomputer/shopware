{extends file="parent:frontend/custom/index.tpl"}

{block name='frontend_index_start' append}
    {$sBreadcrumb=[]}
{/block}

{* Sidebar left *}
{block name="frontend_index_content_left"}
    {*include file="frontend/index/sidebar.tpl"*}
{/block}
