{extends file='parent:frontend/custom/index.tpl'}

{block name="frontend_index_header_css_screen" append}
    <style>
        .kontakt{ cursor: pointer; }
        .kontaktinfos{
            display: none;
            border: 1px solid #efefef;
            padding: 10px 20px;
            margin: 0 0 20px 0;
        }
    </style>
{/block}
{block name="frontend_index_header_javascript" append}
    <script>
    jQuery(document).ready(function($) {
        $('body').on('click', '.kontakt', function(){
            $('.kontaktinfos').slideUp();
            $(this).next('.kontaktinfos').slideDown();
        })
    });
    </script>
{/block}
{block name='frontend_index_content_wrapper'}

    <div id="center" class="{$colCenter}">

        <div class="panel panel-info custom">
            {block name='frontend_custom_article_title'}
            <div class="panel-heading">
                <h1 class="panel-title">Herstellerliste</h1>
            </div>
            {/block}
            <div class="panel-body">
                {block name='frontend_custom_article_content'}
                    {$initialA=''}
                    {foreach $hersteller as $h }
                        {$initialB=$h.name|substr:0:1}
                        {if $initialB!=$initialA}
                            <hr />
                            <h2>{$initialB}</h2>
                            {$initialA=$initialB}
                        {/if}
                        <h4 class="kontakt">
                            <strong>{$h.name}</strong> &#x96; {$h.meta_title}
                        </h4>
                        <div class="kontaktinfos">
                            {$h.description}
                        </div>
                    {/foreach}
                    {*<pre>{$hersteller|var_dump}</pre>*}
                {/block}
            </div>
        </div>

    </div>

{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}
