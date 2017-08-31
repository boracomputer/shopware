{* Filter button which will be included in the "listing/listing_actions.tpl" *}
{namespace name="frontend/listing/listing_actions"}

{block name="frontend_listing_actions_filter_button"}
    {if $facets|count > 0}
        <div class="action--filter-btn">
            <a href="#"
               class="filter--trigger btn is--small is--active"
               data-filter-trigger="true"
               data-offcanvas="true"
               data-offCanvasSelector=".action--filter-options"
               data-closeButtonSelector=".filter--close-btn">
                <i class="icon--blank fa fa-sliders"></i>
                {s name='ListingFilterButton'}{/s}
                <span class="action--collapse-icon"></span>
            </a>
        </div>
    {/if}
{/block}
