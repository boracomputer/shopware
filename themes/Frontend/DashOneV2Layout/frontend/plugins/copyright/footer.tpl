{extends file="parent:frontend/plugins/copyright/footer.tpl"}

{block name="frontend_index_shopware_footer"}
	{* Copyright *}
	{block name="frontend_index_shopware_footer_copyright"}
		<div class="footer--copyright">
			<a href="{$link}">{$text}<a/>
		</div>
	{/block}

	{* Logo *}
	{block name="frontend_index_shopware_footer_logo"}
	{/block}
{/block}
