
<table border="0" class="product--delivery" cellpadding="0" cellspacing="0" style="font-size:12px;">
    {$i=1}
    {foreach $stock.stockStoresDetail as $storeId => $options}
        {if $storeId==32 || $storeId==33}{continue}{/if}
        {$i=$i+1}
        {if $i%2 == 0}
            <tr>
        {/if}
                <td class="{$options.textClass}">{$tbStores[$storeId].name|utf8_encode}</td>
                <td class="{$options.textClass}"><i class="{$options.textIcon}"></i> {$options.text}</td>
        {if $i-1%2 == 0}
            </tr>
        {/if}
    {/foreach}
</table>
