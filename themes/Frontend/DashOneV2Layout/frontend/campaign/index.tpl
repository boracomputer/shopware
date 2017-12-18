{extends file='parent:frontend/campaign/index.tpl'}


{block name='frontend_home_index_promotions'}
    {foreach $landingPage.emotions as $emotion}
        {if $shopID != $emotion.attribute.shopid|intval
            && $emotion.attribute.shopid!=0
            && $emotion.attribute.shopid!=''}

            {continue}

        {/if}
        <div class="content--emotions">
            <div class="emotion--wrapper"
                 data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                 data-availableDevices="{$emotion.devices}">
            </div>
        </div>
    {/foreach}
{/block}
