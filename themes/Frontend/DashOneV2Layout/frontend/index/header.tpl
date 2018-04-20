{extends file='parent:frontend/index/header.tpl'}

{* Stylesheets *}
{block name="frontend_index_header_css_screen"}
    {{compileLess timestamp={themeTimestamp} output="lessFiles"}}
    {foreach $lessFiles as $stylesheet}
        <link href="{$stylesheet}" media="all" rel="stylesheet" type="text/css" />
    {/foreach}

    {if $theme.additionalCssData}
        {$theme.additionalCssData}
    {/if}

    <style>

    </style>
{/block}
