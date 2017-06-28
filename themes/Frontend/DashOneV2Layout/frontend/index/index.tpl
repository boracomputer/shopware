{extends file='parent:frontend/index/index.tpl'}

{block name='frontend_index_navigation' prepend}
    <div id="topbar">FOO
{/block}
{block name='frontend_index_navigation' append}
    BAR</div>
{/block}
