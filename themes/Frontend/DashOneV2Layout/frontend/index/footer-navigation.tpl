{extends file='parent:frontend/index/footer-navigation.tpl'}
{namespace name="frontend/index/menu_footer"}

{* Service hotline *}
{block name="frontend_index_footer_column_service_hotline"}
    <div class="footer--column column--hotline is--first block">
        {block name="frontend_index_footer_column_service_hotline_headline"}
            <div class="column--headline">{s name="sFooterServiceHotlineHead"}{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_service_hotline_content"}
            <div class="column--content">
                <p class="column--desc">{s name="sFooterServiceHotline"}{/s}</p>
            </div>
        {/block}
    </div>
{/block}

{block name="frontend_index_footer_column_newsletter_form" append}
<hr />
<p><small>
    {s name="sFooterVatInfo"}*Alle Preise verstehen sich inkl. Mehrwertsteuer zzgl. Versandkosten und ggf. Nachnahmegebühren, wenn nicht anders beschrieben{/s}
</small></p>
{/block}
