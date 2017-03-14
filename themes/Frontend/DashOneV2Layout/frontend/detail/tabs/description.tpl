{extends file='parent:frontend/detail/tabs/description.tpl'}

{block name="frontend_detail_description"}
<div class="content--description">

    {* Headline *}
    {block name='frontend_detail_description_title'}
    {/block}

    {* CDNet description*}
    <div id="ccs-inline-content"></div>

    {* Product description *}
    {block name='frontend_detail_description_text'}
        <div class="product--description" itemprop="description">
            {if $sArticle.description_long}
                {$sArticle.description_long}
            {else}
                {$sArticle.attr7}
            {/if}
        </div>
    {/block}


    {* Product - Further links *}
    {block name='frontend_detail_description_links'}
        {* Further links title *}
        {block name='frontend_detail_description_links_title'}
        {/block}

        {* Links list *}
        {block name='frontend_detail_description_links_list'}
        {/block}
    {/block}

    {* Downloads *}
    {block name='frontend_detail_description_downloads'}
        {if $sArticle.sDownloads}

            {* Downloads title *}
            {block name='frontend_detail_description_downloads_title'}
                <div class="content--title">
                    {s name="DetailDescriptionHeaderDownloads"}{/s}
                </div>
            {/block}

            {* Downloads list *}
            {block name='frontend_detail_description_downloads_content'}
                <ul class="content--list list--unstyled">
                    {foreach $sArticle.sDownloads as $download}
                        {block name='frontend_detail_description_downloads_content_link'}
                            <li class="list--entry">
                                <a href="{$download.filename}" target="_blank" class="content--link link--download" title="{"{s name="DetailDescriptionLinkDownload"}{/s}"|escape} {$download.description|escape}">
                                    <i class="icon--arrow-right"></i> {s name="DetailDescriptionLinkDownload"}{/s} {$download.description}
                                </a>
                            </li>
                        {/block}
                    {/foreach}
                </ul>
            {/block}
        {/if}
    {/block}

    {* Comment - Item open text fields attr3 *}
    {block name='frontend_detail_description_our_comment'}
    {/block}
</div>
{/block}
