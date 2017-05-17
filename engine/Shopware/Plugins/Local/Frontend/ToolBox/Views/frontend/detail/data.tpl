{extends file='parent:frontend/detail/data.tpl'}

{block name="frontend_detail_data_delivery"}
    {*$smarty.block.parent*}
    {if $shopID != 3}
        <br />
        <strong class="entry--label">
            Filialbestand:
        </strong>
        <span class="entry--content">
            <a href="#" class="js--toggle-trigger product--delivery" id="get-stock">
                <span class="{$sArticle.stock.textClass}">
                    <i class="{$sArticle.stock.textIcon}"></i> {$sArticle.stock.text}
                </span>
            </a>
        </span>
    {/if}
{/block}
