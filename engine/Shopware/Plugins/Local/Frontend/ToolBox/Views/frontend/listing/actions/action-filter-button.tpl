{extends file="parent:frontend/listing/actions/action-filter-button.tpl"}
{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_button"}
{if $facets|count > 0}
    <div class="action--filter-btn">
        <a href="#"
           class="filter--trigger btn is--small is--active"
           data-filter-trigger="true"
           data-offcanvas="true"
           data-offCanvasSelector=".action--filter-options"
           data-closeButtonSelector=".filter--close-btn">
            <i class="fa fa-sliders"></i>
            {s name='ListingFilterButton'}{/s}
            <span class="action--collapse-icon"></span>
        </a>
    </div>
{/if}
{if $shopID != 3}
    <form class="action--store" method="POST">
        <select name="tbStoreUser"
                class="sort--field action--field store--select"
                data-auto-submit="true">
            <option value="0">Alle Filialbestände anzeigen</option>
            {foreach $tbStores as $storeID => $store}
                <option value="{$storeID}"{if $tbStoreUser==$storeID} SELECTED{/if}>{$store.shopName} {$store.name|utf8_encode}</option>
            {/foreach}
        </select>
    </form>
{/if}
{/block}
