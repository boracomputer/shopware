{extends file="parent:frontend/listing/actions/action-filter-button.tpl"}
{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_button" append}
{if $shopID != 3}
    <div class="sort--select select-field">
    <form class="action--store action--sort action--content" method="POST">
        <select name="tbStoreUser"
                class="sort--field action--field"
                data-auto-submit="true">
            <option value="0">Alle Filialbestände anzeigen</option>
            {foreach $tbStores as $storeID => $store}
                <option value="{$storeID}"{if $tbStoreUser==$storeID} SELECTED{/if}>{$store.shopName} {$store.name|utf8_encode}</option>
            {/foreach}
        </select>
    </form>
    </div>
{/if}
{/block}
