{extends file='parent:frontend/index/topbar-navigation.tpl'}

{* Service / Support drop down *}
{block name='frontend_index_checkout_actions_service_menu' append}
    <div class="navigation--entry entry--service has--drop-down" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
        <i class="icon--service"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkPreislisten'}Preislisten{/s}

        {* Include of the widget *}
        {block name="frontend_index_checkout_actions_service_menu_include"}
            {include file="widgets/index/menu.tpl" sGroup=gSchwanPreislisten}
        {/block}
    </div>
{/block}
