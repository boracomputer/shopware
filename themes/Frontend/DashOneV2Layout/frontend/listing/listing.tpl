{extends file="parent:frontend/listing/listing.tpl"}

{block name="frontend_listing_emotions"}
            <div class="content--emotions">

                {foreach $emotions as $emotion}

                    {if $hasEscapedFragment}
                        {if 0|in_array:$emotion.devicesArray}
                            {if $emotion.showListing == 1}
                                {$showListing = true}
                            {/if}

                            {if $emotion.fullscreen == 1}
                                {$fullscreen = true}
                            {/if}

                            <div class="emotion--fragment">
                                {action module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller shopID=$shopID}
                            </div>
                        {/if}
                    {else}
                        {if $emotion.showListing == 1}
                            {$showListing = true}
                        {/if}

                        {if $emotion.fullscreen == 1}
                            {$fullscreen = true}
                        {/if}

                        <div class="emotion--wrapper"
                             data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller shopID=$shopID}"
                             data-availableDevices="{$emotion.devices}"
                             data-showListing="{if $emotion.showListing == 1}true{else}false{/if}">
                        </div>
                    {/if}
                {/foreach}

                {if !$showListing}
                    {block name="frontend_listing_list_promotion_link_show_listing"}
                        <div class="emotion--show-listing{if $fullscreen} is--align-center{/if}">
                            <a href="{url controller='cat' sPage=1 sCategory=$sCategoryContent.id}" title="{$sCategoryContent.name|escape}" class="link--show-listing{if $fullscreen} btn is--primary{/if}">
                                {s name="ListingActionsOffersLink"}Weitere Artikel in dieser Kategorie &raquo;{/s}
                            </a>
                        </div>
                    {/block}
                {/if}
            </div>
{/block}
