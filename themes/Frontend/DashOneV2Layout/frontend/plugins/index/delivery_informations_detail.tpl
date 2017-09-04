{* Delivery informations *}
{block name='frontend_widgets_delivery_infos'}

    {$stock = $sArticle.attr1|json_decode:"true"}

    <div class="delivery--information delivery--information-online">
        <strong class="entry--label">
            Onlineversand:
        </strong>

        <span class="entry--content">
        {if $sArticle.ordernumber|strpos:"PCK" === 0}
            <span class="{$classStockAvailable}">
                <i class="fa fa-wrench"></i> wird zusammengebaut<br />
                Zusammenbau dauert 3-5 Tage
            </span>

        {elseif isset($sArticle.active) && !$sArticle.active}
            <span class="{$classStockOutOfStock}">
                <i class="{$iconStockOutOfStock}"></i> nicht verf&uuml;gbar
            </span>

        {elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
            <span class="{$classStockOrderable}">
                <i class="{$iconStockOrderable}"></i> Artikel wird bestellt
            </span>

        {elseif $sArticle.esd}
            <span class="{$classStockAvailable}">
                <i class="fa fa-percent"></i> Sofort Download
            </span>
        {elseif $sArticle.attr5=='EDU'}
            <span class="{$classStockOrderable}">
                <i class="fa fa-university"></i> nur auf Anfrage
            </span>

        {elseif $stock[32]>0}
            <span class="{$classStockAvailable}">
                <i class="{$iconStockAvailable}"></i>
                {if $stock[32]<10 && $stock[32]>0}
                   <strong>Lagernd</strong> (nur {$stock[32]} St&uuml;ck)
                {else}
                   <strong>Lagernd</strong> (&gt;10 St&uuml;ck)
                {/if}
            </span>

        {elseif $stock[33]>0 || $sArticle.attr5=='MDS'}
            <span class="{$classStockOrderable}">
                <i class="{$iconStockOrderable}"></i> Artikel wird bestellt
            </span>

        {else}
            <span class="{$classStockOutOfStock}">
                <i class="{$iconStockOutOfStock}"></i> nicht verf&uuml;gbar
            </span>
        {/if}
        </span>
    </div>
{/block}
