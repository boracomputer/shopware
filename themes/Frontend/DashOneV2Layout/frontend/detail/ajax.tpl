{extends file='frontend/detail/index.tpl'}

{* Hide head *}
{block name='frontend_index_header'}{/block}

{* Hide header *}
{block name='frontend_index_navigation'}{/block}

{* hide sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Hide top *}
{block name="frontend_index_content_top"}{/block}

{* Hide crossselling *}
{block name="frontend_detail_index_tabs_cross_selling"}{/block}
{block name='frontend_index_left_last_articles'}{/block}

{* Hide breadcrumbs *}
{block name='frontend_index_breadcrumb'}{/block}

{* Hide footer *}
{block name="frontend_index_footer"}{/block}

{* Hide additional content before the actual content starts *}
{block name="frontend_index_after_body"}{/block}


{block name="frontend_detail_index_tabs_cross_selling_top"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_index_buybox"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_index_delivery_wrapper"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}

{* remove tabs *}
{block name="frontend_detail_tabs_rating"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_tabs_content_rating"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="commerzfinanz_detail_tabs_description"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="commerzfinanz_detail_tabs_content_description"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}


{* remove js *}
{block name="frontend_index_header_javascript"}{/block}
{block name="frontend_index_header_javascript_jquery"}{/block}
{*block name="frontend_index_header_javascript_jquery_lib"}{/block*}
