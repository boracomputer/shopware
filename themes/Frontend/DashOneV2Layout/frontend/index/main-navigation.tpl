{extends file='parent:frontend/index/main-navigation.tpl'}

{* remove HOME button *}
{block name='frontend_index_navigation_categories_top_home'}
{/block}

{block name='frontend_index_navigation_categories_top_entry'}
    {if !$sCategory.hideTop || $sCategory.attribute.disableshopid|intval !== $Shop->getId()}
        <li class="navigation--entry{if $sCategory.flag} is--active{/if}" role="menuitem">
            {block name='frontend_index_navigation_categories_top_link'}
                <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url"{if $sCategory.external} target="{$sCategory.externalTarget}"{/if}>
                    <span itemprop="name">{$sCategory.description}</span>
                </a>
            {/block}
        </li>
    {/if}
{/block}
