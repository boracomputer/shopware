{extends file='parent:frontend/index/index.tpl'}

{block name="frontend_index_header_css_screen" append}
    {* append css files to header here *}
    <link href="{link file='frontend/aktion/test-phan/css/style.css'}" rel="stylesheet">
{/block}

{block name="frontend_index_header_css_screen" append}
    {* append java script files to header here *}
    <script type="text/javascript" src="{link file='frontend/aktion/test-phan/js/script.js'}"></script>
{/block}

{* body class for sidebar wrapper / render aktionen like listings *}
{block name="frontend_index_body_classes"}is--ctl-register is--act-index is--target-account{/block}


{* page title *}
{block name='frontend_index_header_title'}{$tbAktion['name']} | {{config name=sShopname}|escapeHtml}{/block}
{* meta keywords *}
{block name="frontend_index_header_meta_keywords"}{/block}

{* meta description *}
{block name="frontend_index_header_meta_description"}{$tbAktion['description']|strip_tags}{/block}

{* main content *}
{block name='frontend_index_content'}

	<div class="content listing--content">
        <div class="listing--wrapper">

        <div class="clearfix">
            <h2 class="" style="float: left">{$tbAktion.name}</h2>

            {if $tbAktion.valid_to < $smarty.now}
                {$class='error'}
                {$icon='warning'}
                {$text="<strong>Achtung:</strong> Diese Aktion ist am `$tbAktion.valid_to|date_format:'%d.%m.%Y'` abgelaufen"}
            {elseif $tbAktion.valid_from > $smarty.now}
                {$class='warning'}
                {$icon='warning'}
                {$text="<strong>Achtung:</strong> Diese Aktion beginnt erst am `$tbAktion.valid_from|date_format:'%d.%m.%Y'`"}
            {else}
                {$class='success'}
                {$icon='clock2'}
                {$text="Diese Aktion ist gültig vom `$tbAktion.valid_from|date_format:'%d.%m.%Y'` bis einschließlich `$tbAktion.valid_to|date_format:'%d.%m.%Y'`"}
            {/if}

            <div class='alert is--{$class} is--rounded' style='float: right; font-size: 0.75em; line-height: 1em; white-space: nowrap;'>
                <div class="alert--icon">
                    <i class="icon--element icon--{$icon}"></i>
                </div>
                <div class="alert--content">
                    {$text}
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>

            {*if $tbAktion.banner}
                <img src="{$tbAktion.banner}" style="width:100%" />
            {/if*}

            {if $tbAktion.description}
                <div class="panel has--border is--rounded">
                    <div class="panel--body">
                        {$descr = "[[BOTTOM]]"|explode:$tbAktion.description}
                        {$descr.0}
                    </div>
                </div>
                <br />
            {/if}

            <div class="listing--container">
                {foreach $tbAktion.articles as $groupname => $sArticles}
                    <h2>{$groupname}</h2>
                    <div class="listing"
                        data-ajax-wishlist="true"
                        data-compare-ajax="true"
                        {if $theme.infiniteScrolling}
                        data-infinite-scrolling="true"
                        data-loadPreviousSnippet="{s name="ListingActionsLoadPrevious"}{/s}"
                        data-loadMoreSnippet="{s name="ListingActionsLoadMore"}{/s}"
                        data-categoryId="{$sCategoryContent.id}"
                        data-pages="{$pages}"
                        data-threshold="{$theme.infiniteThreshold}"{/if}
                    >
                        {foreach $sArticles as $sArticle}
                            {if $sArticle}
                                {include file="frontend/listing/box_article.tpl"}
                            {/if}
                        {/foreach}
                    </div>
                {/foreach}
            </div>

            {if $descr.1}
                <div class="panel has--border is--rounded">
                    <div class="panel--body" style="color: #999; font-size:12px;">
                        {$descr.1}
                    </div>
                </div>
                <br />
            {/if}

        </div>
    </div>

{/block}
