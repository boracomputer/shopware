{* Offcanvas buttons *}
{block name='frontend_detail_ecolabel_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_ecolabel_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

{block name='frontend_detail_tabs_ecolabel'}
    {* Energieeffizienz *}
    {if $sArticle.attr8|count>0}
    <div class="product--ecolabel">
        <table><tbody>
            <tr><td><strong>Name des Herstellers</strong></td><td>{$sArticle.supplierName}</td></tr>
            <tr><td><strong>Modellbezeichnung</strong></td><td>{$sArticle.suppliernumber}</td></tr>
            <tr><td><strong>Energieeffizienzklasse</strong></td><td>{$sArticle.attr8.class}</td></tr>
            <tr><td><strong>Bildschirmdiagonale</strong></td><td>{$sArticle.attr8.sizeInch} Zoll</td></tr>
            <tr><td><strong>Leistungsaufnahme</strong></td><td>{$sArticle.attr8.watts} Watt</td></tr>
            <tr><td><strong>J&auml;hrlicher Energieverbrauch*</strong></td><td>{$sArticle.attr8.kwhYear} kWh/Jahr</td></tr>
        </tbody></table>
        <small>* 4 Stunden Nutzung pro Tag an 365 Tagen pro Jahr</small>
        <hr>

        <img src='//ecolabel.skillbooks.de/{$sArticle.ordernumber}-{if $shopID==1}bora{elseif $shopID==3}schwan{elseif $shopID==5}km{else}blank{/if}.png'>
    </div>
    {/if}

{/block}
