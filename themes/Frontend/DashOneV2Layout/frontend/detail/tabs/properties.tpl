
{* Properties *}
{block name='frontend_detail_properties'}
    {if $sArticle.sProperties}
        {foreach $sArticle.sProperties as $i => $sProperty}
            {$properties[$sProperty['attributes']['core']->getAttribute()['cfgname']][] = $sProperty}
        {/foreach}
        {$properties|dump}
        <div class="product--properties panel has--border">
            <table class="product--properties-table">

                {foreach $sArticle.sProperties as $i => $sProperty}
                    <tr class="product--properties-row">
                        {* Property label *}
                        {block name='frontend_detail_description_properties_label'}
                            <td class="product--properties-label is--bold">{$sProperty.name|escape}:</td>
                        {/block}

                        {* Property content *}
                        {block name='frontend_detail_description_properties_content'}
                            <td class="product--properties-value">{$sProperty.value|escape}</td>
                        {/block}
                    </tr>
                {/foreach}
            </table>
        </div>
    {/if}
{/block}