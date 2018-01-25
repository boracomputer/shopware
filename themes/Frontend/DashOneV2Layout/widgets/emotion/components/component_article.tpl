{block name="widget_emotion_component_product_panel"}
    {$boxBasic|var_dump}
    {if $Data}
        <div class="emotion--product{if $Data.no_border} is--no-border{/if}">
            {if $boxBasic}
                {$productBoxLayout = ""}
            {else}
                {$productBoxLayout = "emotion"}
            {/if}

            {include file="frontend/listing/box_article.tpl" sArticle=$Data productBoxLayout=$productBoxLayout imageOnly=$Data.productImageOnly}
        </div>
    {/if}
{/block}
