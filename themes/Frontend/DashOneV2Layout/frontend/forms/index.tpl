{extends file='parent:frontend/forms/index.tpl'}

{block name='frontend_index_content_left'}
    {if $sSupport.id!=26}
        {$smarty.block.parent}
    {/if}
{/block}
{block name='frontend_index_breadcrumb'}
    {if $sSupport.id!=26}
        {$smarty.block.parent}
    {/if}
{/block}

{block name='frontend_forms_index_content'}
    {$sSupport|dump}
    {if $sSupport.id!=26}
        {$smarty.block.parent}
    {else}
        {if $sSupport.sElements}
            <div class="forms--container panel has--border is--rounded">
                <div class="panel--body">
                    {block name='frontend_forms_index_elements'}
                        {include file="frontend/forms/elements_b2b.tpl"}
                    {/block}
                </div>
            </div>
        {/if}
    {/if}
{/block}
