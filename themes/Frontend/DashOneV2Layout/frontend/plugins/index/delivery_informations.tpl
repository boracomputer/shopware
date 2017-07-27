{* Delivery informations *}
{block name='frontend_widgets_delivery_infos'}

    {$shipping.1 = "Der Artikel ist auf Lager und wird versandt, sobald die Bestellung bearbeitet wurde."}
    {$shipping.2 = "Der Artikel wird wird beim Lieferanten bestellt und an Sie versandt, sobald der Artikel eintrifft. Dies dauert zwischen 2 bis 5 Werktagen."}
    {$shipping.3 = "Der Artikel ist nicht mehr auf Lager und kann z.Zt. nicht bestellt werden. Sie können sich aber für eine E-Mail Benachrichtigung eintragen und werden Informiert, sobald der Artikel wieder verfügbar ist."}
    {$shipping.4 = "Diesen Artikel können Sie, nach erfolgreichem Bestellvorgang, sofot herunterladen."}
    {$shipping.5 = "Für diesen Artikel fallen keine Versandkosten an!"}
	{$shipping.6 = "Dieser Artikel besteht aus mehreren Einzelkomponenten und wird ggf. für Sie zusammengebaut und getestet. Dies kann bis zu 5 Werktage lang dauern."}

	{*if $sArticle.shippingfree}
	    <div class="shipping_freebtn-xs btn-default toggle-shippinginfo" data-placement="bottom" data-container="body" data-toggle="popover" data-content="{$shipping.6}">
	    	<strong>Kostenloser Versand</strong>
	    </span>
	{/if*}

    {$stock = $sArticle.attr1|json_decode:"true"}

    <div class="product--delivery">
        <div class="delivery--information delivery--information-online">
            <span class="label">Onlineversand: </span>

            {if $sArticle.ordernumber|strpos:"PCK" === 0}
                <span class="{$classStockOrderable}">
			        <i class="fa fa-wrench"></i> wird zusammengebaut
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

	        {elseif $stock[32]>0}
	            <span class="{$classStockAvailable}">
				    <i class="{$iconStockAvailable}"></i>
            	    {if $stock[32]<10 && $stock[32]>0}
            	       <strong>Lagernd</strong> (nur {$stock[32]} St&uuml;ck)
            	    {else}
            	       <strong>Lagernd</strong> (&gt;10 St&uuml;ck)
            	    {/if}
	            </span>

	        {elseif $stock[33]>0}
	            <span class="{$classStockOrderable}">
			        <i class="{$iconStockOrderable}"></i> Artikel wird bestellt
	            </span>

	        {else}
	            <span class="{$classStockOutOfStock}">
			        <i class="{$iconStockOutOfStock}"></i> nicht verf&uuml;gbar
	            </span>
	        {/if}
        </div>
    </div>
{/block}
