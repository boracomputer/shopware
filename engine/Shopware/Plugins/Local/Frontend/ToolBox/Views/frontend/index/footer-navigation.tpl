{extends file='parent:frontend/index/footer-navigation.tpl'}
{namespace name="frontend/index/menu_footer"}

{block name="frontend_index_footer_column_service_menu_after" append}
    {*include file="frontend/filiale/filiale_select_dropdown.tpl"*}
{/block}

{block name="frontend_index_footer_column_newsletter_form"}
    <form action="//kmcomputer.us14.list-manage.com/subscribe/post?u={$chimpmailU}&id={$chimpmailId}" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
        <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="{$chimpmailHidden}" tabindex="-1" value=""></div>

        {block name="frontend_index_footer_column_newsletter_form_field"}
            <input type="email" class="newsletter--field" name="EMAIL" id="newsletter_input" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
        {/block}

        {block name="frontend_index_footer_column_newsletter_form_submit"}
            <button type="submit" class="newsletter--button btn">
                <i class="icon--mail"></i> <span class="button--text">{s name='IndexFooterNewsletterSubmit'}{/s}</span>
            </button>
        {/block}
    </form>
{/block}
