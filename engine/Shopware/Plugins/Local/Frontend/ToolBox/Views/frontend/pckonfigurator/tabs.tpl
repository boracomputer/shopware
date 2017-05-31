{* Tab navigation for the product detail page *}
{block name="frontend_detail_tabs"}
    <div class="tab-menu--product">
        {block name="frontend_detail_tabs_inner"}

            {* Tab navigation *}
            {block name="frontend_detail_tabs_navigation"}
                <div class="tab--navigation">
                    {block name="frontend_detail_tabs_navigation_inner"}

                        {* Description tab *}
                        {block name="frontend_detail_tabs_konfigurator"}
                            <a href="#" class="tab--link" title="{s name='DetailTabsKonfigurator'}{/s}" data-tabName="konfigurator">{s name='DetailTabsKonfigurator'}PC konfigurieren{/s}</a>
                        {/block}

                    {/block}
                </div>
            {/block}

            {* Content list *}
            {block name="frontend_detail_tabs_content"}
                <div class="tab--container-list ">
                    {block name="frontend_detail_tabs_content_inner"}

                        {* Description container *}
                        {block name="frontend_detail_tabs_content_konfigurator"}
                            <div class="tab--container container--konfigurator">
                                {block name="frontend_detail_tabs_content_konfigurator_inner"}

                                    {* Description title *}
                                    {block name="frontend_detail_tabs_content_konfigurator_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_description_title_inner"}
                                                <a href="#" class="tab--title" title="{s name='DetailTabsKonfigurator'}{/s}">{s name='DetailTabsKonfigurator'}{/s}</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Description preview *}
                                    {block name="frontend_detail_tabs_konfigurator_preview"}
                                    {/block}

                                    {* Description content *}
                                    {block name="frontend_detail_tabs_content_konfigurator_konfiguration"}
                                        <div class="tab--content">
                                            {block name="frontend_detail_tabs_content_konfigurator_konfiguration_inner"}
                                                {*$tbKonfigItems|dump*}
                                                {foreach $tbKonfigItems as $groupId => $groupItemsMan}
                                                    {if $groupItemsMan|count==0}
                                                        {continue}
                                                    {/if}
                                                    {$selectedArtnr = $tbKonfigSelected[$groupId]}
                                                    <div class="collapse--header">
                                                        <span class="group--name">{$tbKonfigGroups[$groupId].name}</span>
                                                        <span class="item-selected--name"></span>
                                                        <span class="item-selected--price"></span>
                                                        <span class="collapse--toggler"></span>
                                                    </div>
                                                    <div class="collapse--content konfigurator--group" data-groupId="{$groupId}" id="group-{$groupId}">

                                                        {if $tbKonfigGroups[$groupId].required != 1}
                                                        <div class="konfigurator--group--item" data-itemArtnr="" data-itemPrice="0">
                                                            <label>
                                                                <input name="item[{$groupId}]" value="" type="radio" class="item--input"{if !$selectedArtnr} checked="checked"{/if} />
                                                                <span class="articleName">{$tbKonfigGroups[$groupId].nulllabel}</span>
                                                                <span class="articlePrice">{"0"|currency}</span>
                                                            </label>
                                                        </div>
                                                        {/if}
                                                        {foreach $groupItemsMan as $hersteller => $items}
                                                            {if $groupItemsMan|count>1}
                                                                <h3>{$hersteller}</h3>
                                                            {/if}
                                                            {foreach $items as $i => $item}
                                                                <div class="konfigurator--group--item" data-itemArtnr="{$item.artnr}" data-itemPrice="{$item.sArticle.price}">
                                                                    <label>
                                                                        <input name="item[{$groupId}]" value="{$item.artnr}" type="radio" class="item--input"{if !$selectedArtnr && $tbKonfigGroups[$groupId].required == 1 && $i === 0} checked="checked"{/if} />
                                                                        <span class="articleName">{$item.sArticle.articleName}</span>
                                                                        <span class="articlePrice">{$item.sArticle.price|currency}</span>
                                                                    </label>
                                                                    <div class="modal--size-table  float--left item--action" data-content="" data-modalbox="true" data-targetSelector="a" data-width="800" data-height="440" data-title="{$item.sArticle.articleName|escape}" data-mode="ajax">
                                                                        <a class="btn is--small product--action btn action--quickview" href="{url controller=detail sArticle={$item.articleID} template='ajax' konfigurator=1}" title="{s name='quickview'}Schnellansicht{/s}">
                                                                            <i class="fa fa-info"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            {/foreach}
                                                        {/foreach}
                                                    </div>
                                                {/foreach}
                                                <div class="konfigurator--footer">
                                                    <hr />
                                                    <div class="konfigurator--footer-total">
                                                        <span class="title">Gesamtsumme:</span>
                                                        <span class="price"></span>
                                                    </div>
                                                    <div class="konfigurator--footer-actions">
                                                        <a href="{url controller='pckonfigurator' action='addToBasket'}" class="buybox--button btn is--primary is--icon-right is--center" name="Jetzt konfigurieren">
                                                            Jetzt kbestellen <i class="icon--arrow-right"></i>
                                                        </a>

                                                    </div>

                                                </div>
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}

                        {* Rating container *}
                        {block name="frontend_detail_tabs_content_rating"}
                        {/block}

                    {/block}
                </div>
            {/block}

        {/block}
    </div>
{/block}
