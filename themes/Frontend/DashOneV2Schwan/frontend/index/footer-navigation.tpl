{extends file='parent:frontend/index/footer-navigation.tpl'}
{namespace name="frontend/index/menu_footer"}

{block name="frontend_index_footer_column_service_hotline_content" append}
    <div class="column--headline">{s name="sFooterServiceOpeningHead"}Öffnungszeiten{/s}</div>
    <div class="column--content">
        <p class="column--desc">
            {s name="sFooterServiceOpening"}<p><strong>Laden:</strong><br />Mo,Mi,Do,Fr: 09:00 - 20:00 Uhr<br>Di: 09:00 - 19:00 Uhr<br>Sa: 09:00 - 18:00 Uhr</p><p><strong>Technik:</strong><br />Mo,Mi,Do,Fr: 11:00 - 20:00 Uhr<br>Di: 11:00 - 19:00 Uhr<br>Sa: geschlossen</p>{/s}
        </p>
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
                    {foreach $sMenu.schwanBottom1 as $item}

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

{block name="frontend_index_footer_column_information_menu"}
    <div class="footer--column column--menu block">
        {block name="frontend_index_footer_column_information_menu_headline"}
            <div class="column--headline">{s name="sFooterShopNavi2"}{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_information_menu_content"}
            <nav class="column--navigation column--content">
                <ul class="navigation--list" role="menu">
                    {block name="frontend_index_footer_column_information_menu_before"}{/block}
                        {foreach $sMenu.schwanBottom2 as $item}

                            {block name="frontend_index_footer_column_information_menu_entry"}
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
                    {block name="frontend_index_footer_column_information_menu_after"}{/block}
                </ul>
            </nav>
        {/block}

    </div>
{/block}
