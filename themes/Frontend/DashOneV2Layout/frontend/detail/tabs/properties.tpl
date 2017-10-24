
{* Properties *}
{block name='frontend_detail_properties'}
    {if $sArticle.sProperties}
        {foreach $sArticle.sProperties as $i => $sProperty}
            {*$sProperty.attributes.core->get('cfgname')|dump*}
            {if $sProperty.attributes}
                {$properties[$sProperty.attributes.core->get('cfgname')][] = $sProperty}
            {/if}
        {/foreach}
        {*$properties|dump*}
        <div class="product--properties">
                {foreach $properties as $groupName => $sProperties}
                    <h3>{$groupName}</h3>
                    <table class="product--properties-table">
                    {foreach $sProperties as $i => $sProperty}
                    <tr class="product--properties-row">
                        {* Property label *}
                        {block name='frontend_detail_description_properties_label'}
                            <td class="product--properties-label is--bold">{$sProperty.name|escape}:</td>
                        {/block}

                        {* Property content *}
                        {block name='frontend_detail_description_properties_content'}
                            <td class="product--properties-value">
                                {if $sProperty.value=='Y'}
                                <i class="fa fa-check" aria-hidden="true"></i> Ja
                                {elseif $sProperty.value=='N'}
                                <i class="fa fa-times" aria-hidden="true"></i> Nein
                                {else}
                                    {$sProperty.value|escape}
                                {/if}
                                {if $sProperty.attributes.core->get('cfgunit')}
                                    &nbsp;{$sProperty.attributes.core->get('cfgunit')}
                                {/if}

                            </td>
                        {/block}
                    </tr>
                    {/foreach}
                    </table>
                {/foreach}
        </div>
    {/if}
{/block}
