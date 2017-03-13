{* Delivery informations *}
{block name='frontend_widgets_delivery_infos'}

    {$stock = $sArticle.attr1|json_decode:"true"}

    <strong class="entry--label">
        Onlineversand:<br />
    </strong>

    <span class="entry--content">
    {if $sArticle.ordernumber|strpos:"PCK" === 0}
        <span class="delivery--text-available">
            <i class="fa fa-wrench"></i> wird zusammengebaut
        </span>

    {elseif isset($sArticle.active) && !$sArticle.active}
        <span>
            <i class="fa fa-times"></i> nicht verf&uuml;gbar
        </span>

    {elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
        <span class="delivery--text-available">
            <i class="fa fa-clock-o"></i> Artikel wird bestellt
        </span>

    {elseif $sArticle.esd}
        <span class="delivery--text-available">
            <i class="fa fa-percent"></i> Sofort Download
        </span>

    {elseif $stock[26]>0}
        <span class="delivery--text-available">
            <i class="fa fa-check"></i>
            {if $stock[26]<10 && $stock[26]>0}
               <strong>Lagernd</strong> (nur {$stock[26]} St&uuml;ck)
            {else}
               <strong>Lagernd</strong> (&gt;10 St&uuml;ck)
            {/if}
        </span>

    {elseif $sArticle.attr2=='W' || $sArticle.attr2=='B'}
        <span class="delivery--text-available">
            <i class="fa fa-clock-o"></i> Artikel wird bestellt
        </span>

    {else}
        <span>
            <i class="fa fa-times"></i> nicht verf&uuml;gbar
        </span>
    {/if}
    </span>

{/block}
