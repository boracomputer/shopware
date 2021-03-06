check{extends file="frontend/index/index.tpl"}

{* body class for sidebar wrapper / render aktionen like listings *}
{block name="frontend_index_body_classes"}is--ctl-register is--act-index is--target-account{/block}

{* page title *}
{block name='frontend_index_header_title'}{$tbStore['name']} | {{config name=sShopname}|escapeHtml}{/block}

{block name="frontend_index_javascript_async_ready" prepend}
    <script src="//maps.google.com/maps/api/js?libraries=places&key=AIzaSyBtEub3B_5Yw2PVwJeNDF2jfrSuqNipyPY" type="text/javascript"></script>
{/block}

{block name="frontend_index_javascript_async_ready" append}
<script type="text/javascript">
document.asyncReady(function() {
	var tbStore = {$tbStoreJSON};
    var markers = [];
    var shopmarker;
    var options = {
	        zoom: 12,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: new google.maps.LatLng({$tbStore.gmap_location})
    };
    var infowindow   = new google.maps.InfoWindow();
    var geocoder     = new google.maps.Geocoder();
    var googlemap    = new google.maps.Map(document.getElementById("google_map"), options);
	var latlng = tbStore['gmap_location'].split(",");
{literal}
        if(tbStore.shopName=="Bora Computer")
            shopmarker = 'https://bora-computer.de/media/image/google_marker_bora.png';
        else if(tbStore.shopName=="K&M Computer")
            shopmarker = 'https://www.kmcomputer.de/media/image/google_marker_km.png';
        else
            shopmarker = 'https://www.schwanthaler-computer.de/media/image/google_markerschwan.png';

	    markers[tbStore.id] = new google.maps.Marker({
	        map: googlemap,
	        position: {lat: parseFloat(latlng[0]), lng: parseFloat(latlng[1])},
            title: tbStore.shopName+' - ' + tbStore.name,
            icon: shopmarker
	    });

        google.maps.event.addListener(markers[tbStore.id], 'click', function(){
            var content = ''
                //+'<h4 id="firstHeading" class="firstHeading">'+this.title+'</h4>'
                +'<div id="bodyContent">'
                +'<p>'+tbStore.street+' '+tbStore.street_no+'<br />'+tbStore.zip_code+' '+tbStore.city+'</p>'
                +'<p>'+tbStore.info_opening_hours+'</p>'
                +'</div>';
            infowindow.setContent(content);
            infowindow.open(googlemap,markers[tbStore.id]);
        });
    });
{/literal}
</script>
{/block}

{* Breadcrumb *}
{block name="frontend_index_start" append}
{$sBreadcrumb = []}
{if $sCustomPage.parent}
	{$sBreadcrumb[] = [
		'name' => {$sCustomPage.parent.page_title|default:$sCustomPage.parent.description},
		'link'=>{url sCustom=$sCustomPage.parent.id}
	]}
{/if}
{$sBreadcrumb[] = [
    'name' => {$sCustomPage.page_title|default:$sCustomPage.description},
    'link'=>{url sCustom=$sCustomPage.id}
]}
{/block}

{block name="frontend_index_header_css_print"}
<style>
@media screen and (min-width: 48em) {
    .content--filiale-info .block--left{
        width: 65%;
        padding: 20px 10px 0 0;
    }
    .content--filiale-info .block--right{
        width: 35%;
    }
    .content--filiale-info .block--right .block{
        padding: 10px;
    }
}
.emotion--banner-slider .banner-slider--banner{
    width:100%;
}
</style>
{/block}

{block name="frontend_index_header"}
	{include file="frontend/custom/header.tpl"}
{/block}

{* Main content *}
{block name="frontend_index_content"}
	<div class="custom-page--content content block">

        {* Custom page tab content *}
        {block name="frontend_custom_article"}
            <div class="content--custom content--filiale-info">
                {block name="frontend_custom_article_inner"}
                    {* Custom page tab headline *}
                    {block name="frontend_custom_article_headline"}
                    	<h1 class="custom-page--tab-headline">{$tbStore.shopName} {$tbStore.name|utf8_encode}</h1>
                    {/block}
                    {* Custom page tab inner content *}
                    {block name="frontend_custom_article_content"}
                        {*$tbStore|dump*}
                        {if $tbStore.banner_top}

                            {if $tbStoreSlider.values|count > 1}
                                <section class="emotion--container emotion--column-12 emotion--mode-fluid emotion--0"
                                         data-emotion="true"
                                         data-gridMode="fluid"
                                         data-fullscreen="false"
                                         data-columns="1"
                                         data-cellSpacing="5"
                                         data-cellHeight="500"
                                         data-baseWidth="1160" style="height:500px">
                                    <div style="height:500px" class="emotion--element col-1 row-1 start-col-1 start-row-1 col-xs-12 start-col-xs-1 row-xs-8 start-row-xs-1 col-s-12 start-col-s-1 row-s-14 start-row-s-1 col-m-12 start-col-m-1 row-m-17 start-row-m-1 col-l-12 start-col-l-1 row-l-24 start-row-l-1 col-xl-12 start-col-xl-1 row-xl-25 start-row-xl-1">
                                        {include 'widgets/emotion/components/component_banner_slider.tpl' Data=$tbStoreSlider}
                                    </div>
                                </section>
                            {else}
                                <img src="{$tbStore.banner_top}" style="margin-bottom: 7px;" />
                            {/if}
                        {/if}
						<div id="google_map" style="height:300px"></div>

						<div class="block-group">
							<div class="block block--left">
                        		{$tbStore.info_text1}
							</div>
							<div class="block block--right">
								<br /><br />
								<div class="block-group">
									<div class="block" style="padding: 10px;">
										<div class="panel has--border">
											<div class="panel--title is--underline">Kontakt</div>
											<div class="panel--body">
                                                {$tbStore.shopName}<br />
                                                {$tbStore.street|utf8_encode} {$tbStore.street_no}<br />
                                                {$tbStore.zip_code} {$tbStore.city|utf8_encode}<br /><br />
												{if $tbStore.email_support}<a href="mailto:{$tbStore.email_support}">{$tbStore.email_support}</a><br />{/if}
												{if $tbStore.phone}Telefon: {$tbStore.phone}<br />{/if}
												{if $tbStore.fax}Fax: {$tbStore.fax}<br />{/if}
											</div>
										</div>
									</div>
									<div class="block" style="padding: 10px;">
										<div class="panel has--border">
											<div class="panel--title is--underline">Öffnungseiten</div>
											<div class="panel--body">
												{$tbStore.info_opening_hours}
											</div>
										</div>
									</div>
									{if $tbStore.info_parking && $tbStore.info_parking!=''}
									<div class="block" style="padding: 10px;">
										<div class="panel has--border">
											<div class="panel--title is--underline">Anfahrt &amp; Parken</div>
											<div class="panel--body">
												{$tbStore.info_parking}
											</div>
										</div>
									</div>
									{/if}
									{*<div class="block" style="width:100%; padding: 10px;">
										<div class="panel has--border">
											<div class="panel--title is--underline">Feedback</div>
											<div class="panel--body">
												{include file="frontend/filiale/feedback.tpl"}
											</div>
										</div>
									</div>*}
								</div>

							</div>
						</div>
                    {/block}
                {/block}
            </div>
        {/block}

	</div>
{/block}

{* Sidebar left *}
{block name="frontend_index_content_left"}
	{include file="frontend/index/sidebar.tpl"}
{/block}
