{extends file='parent:frontend/detail/tabs.tpl'}

{block name="frontend_detail_tabs_navigation_inner" append}
    {* Description tab *}
    {block name="frontend_detail_tabs_properties"}
        {if $sArticle.sProperties}
            <a href="#" class="tab--link" title="{s name='DetailTabsProperties'}Datenblatt{/s}" data-tabName="properties">{s name='DetailTabsProperties'}Dtaenblatt{/s}</a>
        {/if}
        {if $sArticle.attr8|count>1}
            <a href="#" class="tab--link" title="{s name='DetailTabsEcolabel'}Energieeffizienz{/s}" data-tabName="ecolabel">
                {s name='DetailTabsEcolabel'}Energieeffizienz{/s}&nbsp;
                <div class="product--badge badge--ecolabel modal--size-table" style="background: {$sArticle.attr8.color}">
                        {$sArticle.attr8.class}
                </div>
            </a>
        {/if}
    {/block}
{/block}

{block name="frontend_detail_tabs_content_inner" append}
    {if $sArticle.sProperties}
        {block name="frontend_detail_tabs_content_properties"}
            <div class="tab--container">
                {block name="frontend_detail_tabs_content_properties_inner"}

                    {* Description title *}
                    {block name="frontend_detail_tabs_content_properties_title"}
                        <div class="tab--header">
                            {block name="frontend_detail_tabs_content_properties_title_inner"}
                                <a href="#" class="tab--title" title="{s name='DetailTabsProperties'}{/s}">{s name='DetailTabsProperties'}{/s}</a>
                            {/block}
                        </div>
                    {/block}

                    {* Description preview *}
                    {block name="frontend_detail_tabs_description_preview"}
                        <div class="tab--preview">
                            {block name="frontend_detail_tabs_content_properties_preview_inner"}
                            {/block}
                        </div>
                    {/block}

                    {* Description content *}
                    {block name="frontend_detail_tabs_content_properties_description"}
                        <div class="tab--content">
                            {block name="frontend_detail_tabs_content_properties_description_inner"}
                                {include file="frontend/detail/tabs/properties.tpl"}
                            {/block}
                        </div>
                    {/block}

                {/block}
            </div>
        {/block}
    {/if}
    {if $sArticle.attr8|count>1}
        {block name="frontend_detail_tabs_content_ecolabel"}
            <div class="tab--container">
                {block name="frontend_detail_tabs_content_ecolabel_inner"}

                    {* Description title *}
                    {block name="frontend_detail_tabs_content_ecolabel_title"}
                        <div class="tab--header">
                            {block name="frontend_detail_tabs_content_ecolabel_title_inner"}
                                <a href="#" class="tab--title" title="{s name='DetailTabsEcolabel'}{/s}">{s name='DetailTabsEcolabel'}Energieeffizienz{/s}</a>
                            {/block}
                        </div>
                    {/block}

                    {* Description preview *}
                    {block name="frontend_detail_tabs_ecolabel_preview"}
                        <div class="tab--preview">
                            {block name="frontend_detail_tabs_content_ecolabel_preview_inner"}
                            {/block}
                        </div>
                    {/block}

                    {* Description content *}
                    {block name="frontend_detail_tabs_content_ecolabel_description"}
                        <div class="tab--content">
                            {block name="frontend_detail_tabs_content_ecolabel_description_inner"}
                                {include file="frontend/detail/tabs/ecolabel.tpl"}
                            {/block}
                        </div>
                    {/block}

                {/block}
            </div>
        {/block}
    {/if}
{/block}
