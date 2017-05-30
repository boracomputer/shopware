{extends file='parent:frontend/detail/index.tpl'}

{block name='frontend_index_header_title'}{strip}
{if $sBreadcrumb}{foreach from=$sBreadcrumb|array_reverse item=breadcrumb}{$breadcrumb.name} | {/foreach}{/if}{{config name=sShopname}|escapeHtml}
{/strip}{/block}

{block name='frontend_index_header_javascript_jquery' append}
    <script type="text/javascript" src="{link file='frontend/_resources/javascript/jquery.konfigurator.js'}"></script>
{/block}

{block name="frontend_index_header_css_print" append}
<style>
    .container--konfigurator .tab--content .collapse--content{
        padding: 10px;
    }
    .container--konfigurator .tab--content .collapse--content#group-1{
        display: block;
    }
    .container--konfigurator{
        padding: 0 10px;
    }
    .container--konfigurator .tab--content .collapse--content .konfigurator--group .konfigurator--group--item{
        margin-bottom: 5px;
    }
    .container--konfigurator .tab--content .collapse--content .konfigurator--group .konfigurator--group--item .articlePrice{
        float: right;
    }
</style>
{/block}


{block name="frontend_detail_index_buybox"}
<div class="buybox--button-container block-group">
    <a href="#config" class="buybox--button block btn is--primary is--icon-right is--center" name="Jetzt konfigurieren">
        Jetzt konfigurieren <i class="icon--arrow-down"></i>
    </a>
</div>
{/block}

{block name="frontend_detail_data_delivery_wrapper"}
{/block}

{block name='frontend_detail_index_buy_container_inner'}
{/block}

{block name="frontend_detail_index_actions"}
{/block}

{* Tab content container *}
{block name="frontend_detail_index_tabs_cross_selling"}
{/block}

{block name="frontend_detail_index_tabs"}
    {include file="frontend/pckonfigurator/tabs.tpl"}
{/block}

{block name='frontend_detail_index_buy_container_inner'}
{/block}
