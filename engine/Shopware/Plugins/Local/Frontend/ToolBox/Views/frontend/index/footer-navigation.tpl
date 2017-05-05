{block name="frontend_index_footer_column_service_menu_after" append}
    <ul class="service--list is--rounded" role="menu">
        {foreach $tbStores as $storeID => $store}
            <li class="service--entry" role="menuitem">
                <a class="service--link" href="{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}" {if $item.target}target="{$item.target}"{/if}>
                    {$item.description}
                </a>
            </li>
        {/foreach}
    </ul>
{/block}
