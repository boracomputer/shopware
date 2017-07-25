<div class="navigation--entry entry--service has--drop-down" role="menuitem" aria-haspopup="true" data-drop-down-menu="true">
    <i class="icon--home"></i> 29x in Deutschland
    <ul class="service--list is--rounded" role="menu">
        {foreach $tbStores as $storeID => $store}
            <li class="service--entry" role="menuitem">
                {$shop="`$store.shopName`-`$store.name`"|urlencode}
                <a class="service--link" href="{url controller='Filiale' action='info' storeId=$storeID}">
                    {$store.shopName} {$store.name|utf8_encode}
                </a>
            </li>
        {/foreach}
    </ul>
</div>
