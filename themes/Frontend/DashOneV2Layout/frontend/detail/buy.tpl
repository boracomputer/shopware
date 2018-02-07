{extends file='parent:frontend/detail/buy.tpl'}

{block name="frontend_detail_buy_button"}
    {*if {config name="compareShow"}}
        <a href="{url controller='compare' action='add_article' articleID=$sArticle.articleID}" rel="nofollow" data-product-compare-add="true"
           title="{s name='DetailActionLinkCompare' namespace="frontend/detail/actions"}{/s}"
           class="compare--button block btn is--primary is--icon-center is--center is--tablet"
           name="{s name="DetailBuyActionAdd" namespace="frontend/detail/actions"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
            <i class="icon--compare"></i> {s name="DetailActionLinkCompare" namespace="frontend/detail/actions"}{/s}
        </a>
    {/if*}

    {if $sArticle.sConfigurator && !$activeConfiguratorSelection}
        <button class="buybox--button block btn is--disabled is--icon-right" disabled="disabled" aria-disabled="true"
                name="{s name="DetailBuyActionAdd"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
            {s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i>
        </button>
    {else}
    <button class="buybox--button block btn is--primary is--icon-right is--center" {if $buy_box_display}style="{$buy_box_display}"{/if}>
        {s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i>
    </button>
    {/if}


{/block}
