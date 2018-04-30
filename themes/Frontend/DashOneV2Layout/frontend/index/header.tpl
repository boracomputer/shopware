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
        {if {controllerName|lower} == "index"}{literal}
        @media screen and (min-width: 64em){
            #wp{
                background: #000 url(/uploads/aktionen/asus_amd_x470/ASUS_x470_wall.jpg?t={$smarty.now}) no-repeat center top;
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
            .navigation-main{
                background: transparent !important;
            }
            #topbar{
                margin: 0 auto;
                width: 100%;
                max-width: 62.375rem;
                position: relative;
            }
            .footer-main{
                position: relative;
            }
            .content-main--inner{
                padding: 10px !important;
            }
        }
        {/literal}{/if}
        {if {controllerName|lower} == "detail"}{literal}
        @media screen and (min-width: 64em){
            #ban-right{
                width: 160px;
                height: 600px;
                position: absolute;
                background: url(/uploads/aktionen/asus_amd_x470/X470_CrossSeries_160x600.jpg);
                right: -175px;
            }
            #ban-right a{
                display: block;
                width: 100%;
                height: 100%;
            }
        }
        {/literal}{/if}
    </style>
{/block}
