{extends file='parent:frontend/index/topbar-navigation.tpl'}

{* Service / Support drop down *}
{block name='frontend_index_checkout_actions_service_menu' append}
{if $smarty.get.d}
    <div class="navigation--entry entry--preisliste has--drop-down" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
        <div class="entry--link">
            <i class="icon--service"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkPreislisten'}Preislisten{/s}
            {block name="frontend_index_checkout_actions_service_menu_include"}
                {include file="widgets/index/menu.tpl" sGroup=gSchwanPreislisten}
            {/block}
        </div>
    </div>
{/if}
{/block}
