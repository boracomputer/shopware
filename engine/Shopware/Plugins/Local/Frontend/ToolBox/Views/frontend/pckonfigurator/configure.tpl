{extends file='parent:frontend/detail/index.tpl'}

{block name='frontend_index_header_title'}{strip}
{$sArticle.articleName} | {{config name=sShopname}|escapeHtml}
{/strip}{/block}

{block name='frontend_index_header_javascript_jquery_lib' append}
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

    .container--konfigurator .tab--content .collapse--header{

    }
    .container--konfigurator .tab--content .collapse--header .group--name{
        width: 150px;
        display: inline-block;
        font-weight: bold;
    }
    .container--konfigurator .tab--content .collapse--header .item-selected--name{
        font-style: italic;
        display: inline-block;
        max-width: calc(100% - 310px);
        overflow: hidden;
        white-space: nowrap;
    }
    .container--konfigurator .tab--content .collapse--header .item-selected--price{
        float: right;
        margin-right: 35px;
        width: 100px;
        display: inline-block;
        text-align: right;
    }

    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item:nth-child(even){
        background: #f6f6f6;
        padding: 5px 5px;
    }

    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item{
        padding: 5px 5px;
    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item.selected{
        background: #444;
    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item.selected label{
        color: #f5f5f5;
    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item input{

    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item .articlePrice{
        float: right;
    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item .item--action{
        position: absolute;
        right: 130px;
        margin-top: -19px;
    }
    .container--konfigurator .tab--content .collapse--content.konfigurator--group .konfigurator--group--item .item--action .btn{
        height: 20px;
        line-height: 16px;
    }
    .container--konfigurator .tab--content .konfigurator--footer{
        padding: 30px 0 20px 0;
    }
    .container--konfigurator .tab--content .konfigurator--footer .konfigurator--footer-total .title{
        font-size: 16px;
        font-weight: bold;
        margin-left: 20px;
    }
    .container--konfigurator .tab--content .konfigurator--footer .konfigurator--footer-total .price{
        float: right;
        margin: 0 55px 0 0;
        font-size: 26px;
        font-weight: bold;
    }
    .container--konfigurator .tab--content .konfigurator--footer .konfigurator--footer-actions{
        margin-top: 20px;
    }
    .container--konfigurator .tab--content .konfigurator--footer .konfigurator--footer-actions .btn{
        margin: 0 auto;
        display: block;
        width: 100%;
    }

</style>
{/block}

{* replace buy button with config button *}
{block name="frontend_detail_index_buybox"}
<div class="buybox--button-container block-group">
    <a href="#config" class="buybox--button block btn is--primary is--icon-right is--center" name="Jetzt konfigurieren">
        Jetzt konfigurieren <i class="icon--arrow-down"></i>
    </a>
</div>
{/block}

{block name='frontend_detail_index_buy_container_inner'}{/block}

{* remove article actions (bewerten/merken) *}
{block name="frontend_detail_index_actions"}{/block}

{* remove cross selling container *}
{block name="frontend_detail_index_tabs_cross_selling_top"}{/block}

{* remove filialen- & same day delivery availabelity *}
{block name="frontend_detail_data_delivery_wrapper"}{/block}
{block name="frontend_detail_index_delivery_samedaydelivery"}{/block}
{block name="frontend_detail_index_delivery_stores"}{/block}

{* Tab content container *}
{block name="frontend_detail_index_tabs_cross_selling"}
{/block}

{* add konfigurator-tab *}
{block name="frontend_detail_index_tabs"}
    {include file="frontend/pckonfigurator/tabs.tpl"}
    {*$tbKonfigGroups|dump*}
{/block}
