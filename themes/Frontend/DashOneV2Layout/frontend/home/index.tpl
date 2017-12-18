{extends file='parent:frontend/home/index.tpl'}

{block name='frontend_home_index_promotions'}
        {if $hasEmotion}
            <div class="content--emotions">
                {foreach $emotions as $emotion}
                {if $smarty.get.foo=='bar'}
                    {$shopID|var_dump}
                    <pre>{$emotion.attribute|print_r}</pre>
                {/if}
                    {if $shopID !== $emotion.attribute.shopid
                        && $emotion.attribute.shopid!=0
                        && $emotion.attribute.shopid!=''}
                        {continue}
                    {else}
                    <div class="emotion--wrapper"
                         data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller shopID=$shopID}"
                             data-availableDevices="{$emotion.devices}">
                    </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
{/block}
