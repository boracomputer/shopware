{extends file="parent:frontend/checkout/confirm.tpl"}

{block name='frontend_checkout_confirm_submit' prepend}

{if $basketFalseStock|count>0}
    <div class="alert is--warning is--rounded">
        <div class="alert--icon">
        <i class="icon--element icon--warning"></i>
        </div>
        <div class="alert--content">
            Bitte beachten Sie, dass die rot markierten Artikel nicht in ausreichender Menge verfügbar sind. Mit Abschluss der Bestellung, können Sie diese Artikel unverbindlich vorbestellen.
        </div>
    </div>
{/if}
{/block}
