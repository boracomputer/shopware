{extends file='parent:frontend/index/footer-navigation.tpl'}
{namespace name="frontend/index/menu_footer"}

{block name="frontend_index_footer_column_service_menu_after" append}
    {include file="frontend/filiale/filiale_select_dropdown.tpl"}
{/block}
