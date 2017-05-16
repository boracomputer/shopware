{extends file='parent:frontend/index/topbar-navigation.tpl'}

{block name="frontend_index_checkout_actions_service_menu" append}
    <div class="navigation--entry entry--account" role="menuitem">
        <div href="{url controller='account'}" class="entry--link js--account" data-target="#top-bar--login">
            <i class="icon--account"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkMyAccount'}Mein Konto{/s}
        </div>
    </div>
    <div class="navigation--entry entry--note" role="menuitem">
        <a href="{url controller='note'}" class="entry--link">
            <i class="icon--new"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkNotePad'}Merkzettel{/s}
        </a>
        {if $sNotes|@count > 0}
            <span class="badge notes--quantity">{$sNotes|@count}</span>
        {/if}
        </div>

        {action module=widgets controller=StcomDashone action=index}
{/block}

{*block name="frontend_index_top_bar_main"}
    <div class="top-bar">
        {block name="frontend_index_top_bar_main_container"}
            <div class="container block-group">
                {block name="frontend_index_top_bar_nav"}
                    <nav class="top-bar--navigation block" role="menubar">
                        {action module=widgets controller=index action=shopMenu}

                        {block name='frontend_index_navigation_inline'}
                            {if {config name="compareShow"}}
                                <div class="navigation--entry entry--compare is--hidden" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
                                    {block name='frontend_index_navigation_compare'}
                                        {action module=widgets controller=compare}
                                    {/block}
                                </div>
                            {/if}
                        {/block}

                        {block name="frontend_index_checkout_actions_service_menu"}
                            <div class="navigation--entry entry--account" role="menuitem">
                                <div href="{url controller='account'}" class="entry--link js--account js--toggle-trigger" data-target="#top-bar--login">
                                    <i class="icon--account"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkMyAccount'}Mein Konto{/s}
                                </div>
                            </div>
                            <div class="navigation--entry entry--note" role="menuitem">
                                <a href="{url controller='note'}" class="entry--link">
                                    <i class="icon--new"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkNotePad'}Merkzettel{/s}
                                </a>
                                {if $sNotes|@count > 0}
                                    <span class="badge notes--quantity">{$sNotes|@count}</span>
                                {/if}
                                </div>
                                {action module=widgets controller=StcomDashone action=index}
                        {/block}
                    </nav>
                {/block}
            </div>
        {/block}
    </div>
{/block*}
