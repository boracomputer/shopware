<ul class="service--list is--rounded" role="menu">
    {foreach $tbStores as $storeID => $store}
        <li class="service--entry" role="menuitem">
            <a class="service--link" href="{url controller='Filiale' action='info' storeId=$storeId}">
                {$store.shopName} {$store.name|utf8_encode}
            </a>
        </li>
    {/foreach}
</ul>
