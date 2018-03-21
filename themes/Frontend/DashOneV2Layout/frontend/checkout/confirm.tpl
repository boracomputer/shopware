{extends file="parent:frontend/checkout/confirm.tpl"}

{* Additional feature - Add product using the sku *}
{block name="frontend_checkout_confirm_additional_features_add_product"}
    <div class="feature--add-product">
            {block name='frontend_checkout_confirm_add_product_field'}
                <input
                    name="kundenkarteNr" class="add-product--field block" type="text"
                    placeholder="{s name='CheckoutFooterKundenkarteNrPlaceholder' namespace='frontend/checkout/cart_footer_left'}Kundenkarten-Nummer{/s}"
                    data-storage-field="true" data-storageKeyName="kundenkarteNr" data-pseudo-text="true"
                />

            {/block}

            {block name='frontend_checkout_confirm_add_product_button'}
            {/block}
        </form>
    </div>
{/block}
