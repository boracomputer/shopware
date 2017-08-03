{extends file='parent:frontend/index/topbar-navigation.tpl'}

{* Service / Support drop down *}
{*block name='frontend_index_checkout_actions_service_menu' prepend}
    <div class="navigation--entry entry--service has--drop-down" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
        <i class="icon--service"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkPreislisten'}Preislisten{/s}

        {block name="frontend_index_checkout_actions_service_menu_include"}
            {include file="widgets/index/menu.tpl" sGroup=gSchwanPreislisten}
        {/block}
    </div>
{/block*}
