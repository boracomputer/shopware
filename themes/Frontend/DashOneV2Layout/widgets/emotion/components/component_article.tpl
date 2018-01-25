{block name="widget_emotion_component_product_panel"}
    {if $Data}
        <div class="emotion--product{if $Data.no_border} is--no-border{/if}">

            {include file="frontend/listing/box_article.tpl" sArticle=$Data productBoxLayout={if boxBasic}""{else}"emotion"{/if} imageOnly=$Data.productImageOnly}
        </div>
    {/if}
{/block}
