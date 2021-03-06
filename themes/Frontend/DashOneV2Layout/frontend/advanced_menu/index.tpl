{*extends file="parent:frontend/advanced_menu/index.tpl"*}

{function name="categories_top" level=0 teaserWidth=0}

    {if $teaserWidth=='0px' || $teaserWidth=='' || $teaserWidth==0}
        {$columnCount = 4}

    {elseif $teaserWidth|strpos:"%"!==false}
        {$tw=$teaserWidth|replace:'%':''}
        {if $tw<=25}
            {$columnCount = 3}
        {elseif $tw<=50}
            {$columnCount = 2}
        {elseif $tw<=75}
            {$columnCount = 1}
        {/if}
    {elseif $teaserWidth|strpos:"px"!==false}
        {$tw=$teaserWidth|replace:'px':''}
        {if $tw<=250}
            {$columnCount = 3}
        {elseif $tw<=500}
            {$columnCount = 2}
        {elseif $tw<=750}
            {$columnCount = 1}
        {/if}
    {/if}


    <ul class="menu--list menu--level-{$level} columns--{$columnCount}"{if $level === 0} style="width: calc( 100% - {$teaserWidth} );"{/if}>
    {block name="frontend_plugins_advanced_menu_list"}
        {foreach $categories as $category}

            {if $category.hideTop || $category.articleCount===0 || $category.attribute.disableshopid|intval == $Shop->getId()}
                {continue}
            {/if}

            {$categoryLink = $category.link}
            {if $category.external}
                {$categoryLink = $category.external}
            {/if}

            <li class="menu--list-item item--level-{$level}"{if $level === 0} style="width: 100%"{/if}>
                {block name="frontend_plugins_advanced_menu_list_item"}

                    {$icon = ''}
                    {if $shopID==1}
                        {if $category.attribute.attribute4 != ''}
                            {$icon=$category.attribute.attribute4}
                        {/if}
                    {elseif $shopID==5}
                        {if $category.attribute.attribute5 != ''}
                            {$icon=$category.attribute.attribute5}
                        {/if}
                    {elseif $shopID==3}
                        {if $category.attribute.attribute7 != ''}
                            {$icon=$category.attribute.attribute7}
                        {/if}
                    {/if}

                    <a href="{$categoryLink|escapeHtml}" class="menu--list-item-link" title="{$category.name|escape}"{if $category.external} target="{$category.externalTarget}"{/if}>
                        {*if $icon != ''}
                            <span class="pictogram">
                                <img src="{link file=$icon}" />
                            </span>
                        {/if*}
                        {$category.name}
                    </a>

                    {if $category.sub}
                        {call name=categories_top categories=$category.sub level=$level+1}
                    {/if}

                {/block}
            </li>
        {/foreach}
    {/block}
    </ul>
{/function}

<div class="advanced-menu" data-advanced-menu="true" data-hoverDelay="{$hoverDelay}">
{block name="frontend_plugins_advanced_menu"}
    {foreach $sAdvancedMenu as $mainCategory}

        {if !$mainCategory.active || $mainCategory.hideTop || $mainCategory.attribute.disableshopid|intval === $Shop->getId()}
            {continue}
        {/if}

        {$link = $mainCategory.link}
        {if $mainCategory.external}
            {$link = $mainCategory.external}
        {/if}

        {$hasCategories = $mainCategory.activeCategories > 0  && $columnAmount < 4}
        {$hasTeaser = (!empty($mainCategory.media) || !empty($mainCategory.attribute.topbarbannerimage)) && $columnAmount > 0}
        {*$hasTeaser = (!empty($mainCategory.media) || !empty($mainCategory.cmsHeadline) || !empty($mainCategory.cmsText)) && $columnAmount > 0*}

        <div class="menu--container">
            {block name="frontend_plugins_advanced_menu_main_container"}
                <div class="button-container">
                    {block name="frontend_plugins_advanced_menu_button_category"}
                        <a href="{$link|escapeHtml}" class="button--category" title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name|escape:'html'}"{if $mainCategory.external} target="{$mainCategory.externalTarget}"{/if}>
                            <i class="icon--arrow-right"></i>
                            {s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name}
                        </a>
                    {/block}

                    {block name="frontend_plugins_advanced_menu_button_close"}
                        <span class="button--close">
                            <i class="icon--cross"></i>
                        </span>
                    {/block}
                </div>

                {if $hasCategories || $hasTeaser}
                    {$teaserWidth='0px'}
                    {if $hasTeaser}
                        {if $mainCategory.attribute.topbarbannerwidth}
                            {$teaserWidth=$mainCategory.attribute.topbarbannerwidth}
                        {elseif $hasCategories}
                            {$teaserWidth='25%'}
                        {else}
                            {$teaserWidth='100%'}
                        {/if}
                    {/if}
                    <div class="content--wrapper{if $hasCategories} has--content{/if}{if $hasTeaser} has--teaser{/if}">
                        {if $hasCategories}
                            {block name="frontend_plugins_advanced_menu_sub_categories"}
                                {call name="categories_top" categories=$mainCategory.sub teaserWidth=$teaserWidth}
                            {/block}
                        {/if}

                        {if $hasTeaser}
                            {block name="frontend_plugins_advanced_menu_teaser"}
                                {*<div class="menu--teaser"{if $hasCategories} style="width: {$columnAmount * 25}%;"{else} style="width: 100%;"{/if}>*}
                                <div class="menu--teaser" style="width: {$teaserWidth};">
                                    {if !empty($mainCategory.media)}
                                        <a href="{$link|escapeHtml}" title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name|escape:'html'}" class="teaser--image" style="background-image: url({link file={$mainCategory.media.path}});"{if $mainCategory.external} target="{$mainCategory.externalTarget}"{/if}></a>
                                    {/if}

                                    <div class="teaser--text">
                                        {if $mainCategory.attribute.topbarbannerlink}<a href="{$mainCategory.attribute.topbarbannerlink}">{/if}
                                            <img src="{$mainCategory.attribute.topbarbannerimage}" style="float:right" />
                                        {if $mainCategory.attribute.topbarbannerlink}</a>{/if}
                                    </div>
                                </div>
                            {/block}
                        {/if}
                    </div>
                {/if}
            {/block}
        </div>
    {/foreach}
{/block}
</div>
