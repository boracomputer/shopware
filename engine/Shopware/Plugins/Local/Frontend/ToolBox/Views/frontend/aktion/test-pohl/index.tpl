{extends file='parent:frontend/index/index.tpl'}

{block name="frontend_index_header_css_screen" append}
    {* append css files to header here *}
    <link href="{link file='frontend/aktion/test-pohl/css/style.css'}" rel="stylesheet">
{/block}

{block name="frontend_index_header_css_screen" append}
    {* append java script files to header here *}
    <script type="text/javascript" src="{link file='frontend/aktion/test-pohl/js/script.js'}"></script>
{/block}

{* body class for sidebar wrapper / render aktionen like listings *}
{block name="frontend_index_body_classes"}is--ctl-listing is--act-index{/block}

{* page title *}
{block name='frontend_index_header_title'}{$tbAktion['name']} | {{config name=sShopname}|escapeHtml}{/block}
{* meta keywords *}
{block name="frontend_index_header_meta_keywords"}{/block}

{* meta description *}
{block name="frontend_index_header_meta_description"}{$tbAktion['description']}{/block}

{* main content *}
{block name='frontend_index_content'}
    <div class="custom-page--content content block">
        <div class="content--custom">
            Foobar
        </div>
    </div>
{/block}