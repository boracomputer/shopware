{extends file='parent:frontend/index/footer.tpl'}


{* Copyright in the footer *}
{block name="frontend_index_shopware_footer"}

    {* Copyright *}
    {block name="frontend_index_shopware_footer_copyright"}
        <div class="footer--copyright">
        </div>
    {/block}

    {* Logo *}
    {block name="frontend_index_shopware_footer_logo"}
    {/block}

    {$sMainCategories|dump}
{/block}
