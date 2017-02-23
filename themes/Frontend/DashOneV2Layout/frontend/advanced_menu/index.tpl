{extends file="parent:frontend/advanced_menu/index.tpl"}

{block name="frontend_plugins_advanced_menu"}
    {foreach $sAdvancedMenu as $mainCategory}

        {if !$mainCategory.active || $mainCategory.hideTop}
            {continue}
        {/if}

        {$link = $mainCategory.link}
        {if $mainCategory.external}
            {$link = $mainCategory.external}
        {/if}

        {$hasCategories = $mainCategory.activeCategories > 0  && $columnAmount < 4}
        {$hasTeaser = (!empty($mainCategory.media) || !empty($mainCategory.attribute.attribute4)) && $columnAmount > 0}
        {$image =  ";"|explode:$mainCategory.attribute.attribute4}

        <div class="menu--container">
            {block name="frontend_plugins_advanced_menu_main_container"}
                <div class="button-container">
                    {block name="frontend_plugins_advanced_menu_button_category"}
                        <a href="{$link|escapeHtml}" class="button--category" title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name|escape:'html'}">
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
                    <div class="content--wrapper{if $hasCategories} has--content{/if}{if $hasTeaser} has--teaser{/if}">
                        {if $hasCategories}
                            {block name="frontend_plugins_advanced_menu_sub_categories"}
                                {call name="categories_top" categories=$mainCategory.sub}
                            {/block}
                        {/if}

                        {if $hasTeaser}
                            {block name="frontend_plugins_advanced_menu_teaser"}
                                {if $hasCategories}
                                    <div class="menu--delimiter" style="right: {$columnAmount * 25}%;"></div>
                                {/if}
                                <div class="menu--teaser"{if $hasCategories} style="width: {$columnAmount * 25}%;"{else} style="width: 100%;"{/if}>
                                    {if !empty($mainCategory.media)}
                                        <a href="{$link|escapeHtml}" title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name|escape:'html'}" class="teaser--image" style="background-image: url({link file={$mainCategory.media.path}});"></a>
                                    {/if}

                                    <div class="teaser--text">
                                        {if $image.1}<a href="{$image.1}">{/if}
                                            <img src="{$image.0}" />
                                        {if $image.1}</a>{/if}
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