{extends file="parent:frontend/checkout/confirm.tpl"}

{block name='frontend_checkout_confirm_left_shipping_method'}
{if $sDispatch.id==$spuDispatchId}
    <p class="shipping--method-info">
        <strong class="shipping--title">{s name="ConfirmHeadDispatch"}{/s}</strong>
        <span class="shipping--description" title="{$sDispatch.name}">{$sDispatch.name|truncate:25:"...":true}</span>
        {*<span class="shipping--description" title="{$sDispatch.name}">{$sDispatch.description}</span>*}
        {if $errorNoStore}
            {include file="frontend/_includes/messages.tpl" type="error" content=$errorNote}
        {/if}
        <select name="orderAttributes[attribute1]" class="" required="required" aria-required="true">
            <option value="">Selstabholer&#x96;Filiale wählen&#x85;</option>
            {foreach $tbStores as $store}
            <option value="{$store.id}">{$store.shopName|utf8_encode} {$store.name|utf8_encode}</option>
            {/foreach}
        </select>
    </p>
{else}
    {$smarty.block.parent}
{/if}
{/block}

{block name='frontend_checkout_confirm_left_payment_method'}
    <p class="payment--method-info">
        <strong class="payment--title">{s name="ConfirmInfoPaymentMethod" namespace="frontend/checkout/confirm"}{/s}</strong>
        <span class="payment--description">{$sUserData.additional.payment.description}</span>
    </p>
    {if !$sUserData.additional.payment.esdactive && {config name="showEsd"}}
        {*<p class="payment--confirm-esd">{s name="ConfirmInfoInstantDownload" namespace="frontend/checkout/confirm"}{/s}</p>*}
    {/if}
{/block}
