{extends file='parent:frontend/index/topbar-navigation.tpl'}

{block name='frontend_index_checkout_actions_service_menu'}

<div class="navigation--entry entry--stores" role="menuitem">
    <div href="#" class="entry--link js--toggle-trigger" data-target="#top-bar--stores">
        <i class="icon--house"></i> {s namespace='frontend/index/checkout_actions' name='IndexLinkUserStore'}Meine Filiale{/s}
    </div>
</div>

<nav class="top-bar--login block js--toggle-target" role="menubar" id="top-bar--stores">
    <small>
    Verfügbarkeit Ihrer Filiale direkt anzeigen:
    <form class="action--store action--content language--form" method="POST" data-action-form="true">
        <select name="tbStoreUser" class="sort--field action--field" data-auto-submit="true" data-class="">
            <option value="0">Filiale wählen</option>
            {foreach $tbStores as $storeID => $store}
            <option value="{$storeID}"{if $tbStoreUser==$storeID} SELECTED{/if}>{$store.shopName} {$store.name|utf8_encode}</option>
            {/foreach}
        </select>
    </form>
    </small>
</nav>

{/block}
