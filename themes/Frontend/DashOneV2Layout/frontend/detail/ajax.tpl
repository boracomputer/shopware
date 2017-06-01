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


{* remove things for konfigurator item quick view *}
{block name="frontend_detail_index_header"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_index_name"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_index_tabs_cross_selling_top"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_index_buybox"}
    {if !$smarty.get.konfigurator}
        {$smarty.block.parent}
    {else}
        <button class="btn is--primary is--icon-right is--center konfigurator--select-item modal--close" name="Konfigurieren" style="width: 100%; height: auto; position: relative; top: 0; left: 0; font-size: 16px;">
            In den PC einbauen <i class="icon--plus3"></i>
        </button>
    {/if}
{/block}
{block name="frontend_detail_index_delivery_wrapper"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{* remove tabs *}
{block name="frontend_detail_tabs_rating"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="frontend_detail_tabs_content_rating"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="commerzfinanz_detail_tabs_description"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}
{block name="commerzfinanz_detail_tabs_content_description"}{if !$smarty.get.konfigurator}{$smarty.block.parent}{/if}{/block}

{* remove js *}
{block name="frontend_index_header_javascript"}{/block}
{block name="frontend_index_header_javascript_jquery" append}
    {if $smarty.get.konfigurator}
        <script>
            $('.js--modal').on('click', '.konfigurator--select-item', function(){
                var i = $('#group-{$smarty.get.groupId}').find('input[data-itemArtnr={$sArticle.ordernumber}]');
                console.log(i);
                //i.prop("checked", true);
                //updateItem(i);
            });
        </script>
    {/if}
{/block}

{*block name="frontend_index_header_javascript_jquery_lib"}{/block*}
