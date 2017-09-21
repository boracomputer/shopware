{extends file="parent:frontend/listing/actions/action-filter-button.tpl"}
{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_button" append}
    <div class="sort--select select-field">
        <select name="tbStoreUser"
                class="sort--field action--field"
                data-auto-submit="true">

            <option value="0">Alle Filialbestände anzeigen</option>
            {foreach $sortings as $sorting}
                <option value="{$storeID}"{if $tbStoreUser==$storeID} SELECTED{/if}>{$store.shopName} {$store.name|utf8_encode}</option>
            {/foreach}
        </select>
    </div>
{/block}
