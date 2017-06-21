{extends file='parent:frontend/index/main-navigation.tpl'}

{* remove HOME button *}
{block name='frontend_index_navigation_categories_top_home'}
{/block}

{block name='frontend_index_navigation_categories_top_entry'}
    {if $sCategory.attribute.disableshopid|intVal !== $Shop->getId()|intVal && !$sCategory.hideTop}
        <li class="navigation--entry{if $sCategory.flag} is--active{/if}" role="menuitem">
        {block name='frontend_index_navigation_categories_top_link'}
            <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url">
                <span itemprop="name">{$sCategory.description}</span>
            </a>
        {/block}
        </li>
    {/if}
{/block}
