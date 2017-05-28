{* Tab navigation for the product detail page *}
{block name="frontend_detail_tabs"}
    <div class="tab-menu--product">
        {block name="frontend_detail_tabs_inner"}

            {* Tab navigation *}
            {block name="frontend_detail_tabs_navigation"}
                <div class="tab--navigation">
                    {block name="frontend_detail_tabs_navigation_inner"}

                        {* Description tab *}
                        {block name="frontend_detail_tabs_konfigurator"}
                            <a href="#" class="tab--link" title="{s name='DetailTabsKonfigurator'}{/s}" data-tabName="konfigurator">{s name='DetailTabsKonfigurator'}PC konfigurieren{/s}</a>
                        {/block}

                    {/block}
                </div>
            {/block}

            {* Content list *}
            {block name="frontend_detail_tabs_content"}
                <div class="tab--container-list">
                    {block name="frontend_detail_tabs_content_inner"}

                        {* Description container *}
                        {block name="frontend_detail_tabs_content_konfigurator"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_konfigurator_inner"}

                                    {* Description title *}
                                    {block name="frontend_detail_tabs_content_konfigurator_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_description_title_inner"}
                                                <a href="#" class="tab--title" title="{s name='DetailTabsKonfigurator'}{/s}">{s name='DetailTabsKonfigurator'}{/s}</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Description preview *}
                                    {block name="frontend_detail_tabs_konfigurator_preview"}
                                    {/block}

                                    {* Description content *}
                                    {block name="frontend_detail_tabs_content_konfigurator_konfiguration"}
                                        <div class="tab--content">
                                            {block name="frontend_detail_tabs_content_konfigurator_konfiguration_inner"}
                                                {*$tbKonfigItems|dump*}
                                                {foreach $tbKonfigItems as $groupId => $groupItems}
                                                    <h2>{$tbKonfigGroups[$groupId].name}</h2>
                                                    {foreach $groupItems as $item}
                                                        {$item.sArticle.articleName} ({$item.sArticle.price|currency})<br />
                                                    {/foreach}
                                                {/foreach}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}

                        {* Rating container *}
                        {block name="frontend_detail_tabs_content_rating"}
                        {/block}

                    {/block}
                </div>
            {/block}

        {/block}
    </div>
{/block}
