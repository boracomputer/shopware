{extends file='parent:frontend/home/index.tpl'}

{block name='frontend_home_index_promotions'}
        {if $hasEmotion}
            <div class="content--emotions">
                {foreach $emotions as $emotion}
                    {if $shopID != $emotion.attribute.shopid|intval
                        && $emotion.attribute.shopid!=0
                        && $emotion.attribute.shopid!=''}
                        {continue}
                    {/if}
                    <div class="emotion--wrapper"
                         data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller shopID=$shopID}"
                             data-availableDevices="{$emotion.devices}">
                    </div>
                {/foreach}
            </div>
        {/if}
{/block}
