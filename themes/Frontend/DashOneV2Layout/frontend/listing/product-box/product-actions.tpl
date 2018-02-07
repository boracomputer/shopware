{namespace name="frontend/listing/box_article"}

{* Product actions *}
{block name='frontend_listing_box_article_actions_content'}
    <div class="product--actions">

        {block name='frontend_listing_box_article_actions_buynow'}
        <form name="sAddToBasket" method="post" action="{url controller='checkout' action='addArticle'}" class="buybox--form float--right" data-add-article="true" data-eventname="submit" data-showmodal="false" data-addarticleurl="{url controller='checkout' action='ajaxAddArticleCart'}">
            <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}">
            <input type="hidden" name="sQuantity" value="1">
            <button class="buybox--button btn action--to-basket is--primary is--icon-right is--full is--small float--left" name="{s name='ButtonToBasket'}In den Warenkorb{/s}">
                {s name='ButtonToBasket'}In den Warenkorb{/s} <i class="icon--arrow-right"></i>
            </button>
        </form>
        {/block}

        {* Compare button *}
        {block name='frontend_listing_box_article_actions_compare'}
            {if {config name="compareShow"}}
                <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID}" method="post" class="float--left">
                    <button type="submit"
                        title="{s name='ListingBoxLinkCompare'}{/s}"
                        class="btn product--action action--compare"
                        data-product-compare-add="true">
                            <i class="icon--compare"></i> {s name='ListingBoxLinkCompare'}{/s}
                    </button>
                </form>
            {/if}
        {/block}

        {* Note button *}
        {block name='frontend_listing_box_article_actions_save'}
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post" class="float--left">
                <button type="submit"
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="btn action--note btn is--small product--action"
                   data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--tag"></i> Merken
                </button>
            </form>
        {/block}

        {*<div class="modal--size-table  float--left" data-width="800" data-height="440">
            <a class="btn is--small product--action btn action--quickview" href="{url controller=detail sArticle={$sArticle.articleID} template='ajax'}" title="{s name='quickview'}Schnellansicht{/s}" data-title="{$sArticle.articleName|escapeHtml}">
                <i class="fa fa-eye"></i>
            </a>
        </div>*}

        {* @deprecated: block no longer in use *}
        {block name='frontend_listing_box_article_actions_more'}{/block}

        {* @deprecated: misleading name *}
        {block name="frontend_listing_box_article_actions_inline"}{/block}
    </div>
{/block}
