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
        {if ({controllerName|lower} == "index"}
        .page-wrap{
            background: #000 url(/uploads/aktionen/asus_amd_x470/ASUS_x470_wall.jpg) no-repeat top center;
            background-size: auto;
            background-attachment: fixed;
        }
        {/if}
    </style>
{/block}
