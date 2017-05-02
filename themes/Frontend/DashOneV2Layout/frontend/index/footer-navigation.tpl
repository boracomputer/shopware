{extends file='parent:frontend/index/footer-navigation.tpl'}

{* Service hotline *}
{block name="frontend_index_footer_column_service_hotline"}
    <div class="footer--column column--hotline is--first block">
        {block name="frontend_index_footer_column_service_hotline_headline"}
            <div class="column--headline">{s name="sFooterServiceHotlineHead"}{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_service_hotline_content"}
            <div class="column--content">
                <p class="column--desc">{s name="sFooterServiceHotline"}{/s}</p>
            </div>
        {/block}
    </div>
{/block}

{block name="frontend_index_footer_column_service_menu"}
    <div class="footer--column column--menu block">
        {block name="frontend_index_footer_column_service_menu_headline"}
            <div class="column--headline">{s name="sFooterShopNavi1"}{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_service_menu_content"}
            <nav class="column--navigation column--content">
                <ul class="navigation--list" role="menu">
                    {block name="frontend_index_footer_column_service_menu_before"}{/block}
                    {foreach $sMenu.gBottom as $item}

                        {block name="frontend_index_footer_column_service_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    {$item.description}
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/block}
                    {/foreach}

                    {block name="frontend_index_footer_column_service_menu_after"}{/block}
                </ul>
            </nav>
        {/block}
    </div>
{/block}

Telefonische Unterst&uuml;tzung und Beratung zu Ihrer Bestellung und mehr unter:<br /><br /><a href="tel:+491805336636" class="footer--phone-link">0180 - 5 33 66 36<sup><small>1</small></sup></a><br/><br/>Mo-Fr: 09:30 bis 18:30 Uhr<br><br/><small><sup>1</sup> 14 Cent/Minute aus dem deutschen Festnetz. Mobilfunk max. 42 Cent/Minute.</small>
