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
        {literal}{if ({controllerName|lower} == "index"}
        @media screen and (min-width: 64em){
            .#wp{
                background: #000 url(/uploads/aktionen/asus_amd_x470/ASUS_x470_wall.jpg) no-repeat center top;
                background-attachment: fixed;
                width: 100%;
                height: 100%;
                min-height: 1200px;
                position: absolute;
                top: 0;
            }
            #wp a{
                display: block;
                width: 100%;
                height: 100%;
            }
        }
        {/if}{/literal}
    </style>
{/block}
