
{block name="frontend_widgets_banner_slider_link"}
    <a class="banner-slider--link" href="{$banner.link}" title="{$banner.title|escape}"{if $banner.link|strpos:"http://"!==false} target="_blank"{/if}>
        {$banner.altText}
    </a>
{/block}
