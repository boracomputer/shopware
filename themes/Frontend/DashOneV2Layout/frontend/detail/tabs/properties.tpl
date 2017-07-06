
{* Properties *}
{block name='frontend_detail_properties'}
    {if $sArticle.sProperties}
        {foreach $sArticle.sProperties as $i => $sProperty}
            {*$sProperty.attributes.core->get('cfgname')|dump*}
            {$properties[$sProperty.attributes.core->get('cfgname')][] = $sProperty}
        {/foreach}
        {*$properties|dump*}
        <div class="product--properties panel has--border">
            <table class="product--properties-table">
                {foreach $properties as $groupName => $sProperties}
                    <tr class="product--properties-row">
                        <td class="product--properties-group" colspan="2">
                            <h3>{$groupName}</h3>
                        </td>
                    </tr>
                    {foreach $sProperties as $i => $sProperty}
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
                {/foreach}
            </table>
        </div>
    {/if}
{/block}
