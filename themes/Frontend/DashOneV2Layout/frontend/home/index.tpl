{extends file='parent:frontend/home/index.tpl'}

{block name='frontend_home_index_promotions'}
        {if $hasEmotion}
            <div class="content--emotions">
                {foreach $emotions as $emotion
                    {if $hasEscapedFragment}
                        {if 0|in_array:$emotion.devicesArray}
                            <div class="emotion--fragment">
                                {action module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller shopID=$shopID}
                            </div>
                        {/if}
                    {else}
                        <div class="emotion--wrapper"
                             data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                             data-availableDevices="{$emotion.devices}">
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
{/block}
