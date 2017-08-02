{extends file='parent:frontend/index/topbar-navigation.tpl'}

{block name='frontend_index_checkout_actions_service_menu'}
{if $shopID != 3}
    <div class="navigation--entry entry--stores" role="menuitem">
        <div href="#" class="entry--link js--toggle-trigger" data-target="#top-bar--stores">
            <i class="icon--house"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkUserStore'}Meine Filiale{/s}
        </div>
    </div>

    <nav class="top-bar--login block js--toggle-target" role="menubar" id="top-bar--stores">
        Artikel-Verfügbarkeit Ihrer Filiale direkt anzeigen:
        <form class="action--store action--content language--form" method="POST">
            <select name="tbStoreUser" class="sort--field action--field" data-auto-submit="true">
                <option value="" disabled>Filiale wählen...</option>
                <option value="0">Alle Filialbestände anzeigen</option>
                {foreach $tbStores as $storeID => $store}
                <option value="{$storeID}"{if $tbStoreUser==$storeID} SELECTED{/if}>{$store.shopName} {$store.name|utf8_encode}</option>
                {/foreach}
            </select>
        </form>

        Informationen zu unseren Filialen:<br />
        {include file='frontend/filiale/filiale_select_dropdown.tpl'}
    </nav>
{/if}
{/block}
