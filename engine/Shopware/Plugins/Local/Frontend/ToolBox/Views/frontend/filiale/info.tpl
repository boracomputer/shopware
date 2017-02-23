check{extends file="frontend/index/index.tpl"}

{* body class for sidebar wrapper / render aktionen like listings *}
{block name="frontend_index_body_classes"}is--ctl-register is--act-index is--target-account{/block}

{* page title *}
{block name='frontend_index_header_title'}{$tbStore['name']} | {{config name=sShopname}|escapeHtml}{/block}

{block name="frontend_index_header_javascript_jquery" append}
    <script src="https://maps.google.com/maps/api/js?libraries=places&key=AIzaSyCzswhAGvIOYcWcyPPHcoXmJl_MunsWWS4" type="text/javascript"></script>
{/block}

{block name="frontend_index_header_javascript_jquery" append}
<script type="text/javascript">
jQuery(document).ready(function(){
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
        else
            shopmarker = 'https://www.kmcomputer.de/media/image/google_marker_km.png';

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

{block name="frontend_index_header"}
	{include file="frontend/custom/header.tpl"}
{/block}

{* Main content *}
{block name="frontend_index_content"}
	<div class="custom-page--content content block">

        {* Custom page tab content *}
        {block name="frontend_custom_article"}
            <div class="content--custom">
                {block name="frontend_custom_article_inner"}
                    {* Custom page tab headline *}
                    {block name="frontend_custom_article_headline"}
                    	<h1 class="custom-page--tab-headline">{$tbStore.shopName} {$tbStore.name}</h1>
                    {/block}
                    {* Custom page tab inner content *}
                    {block name="frontend_custom_article_content"}
						<div id="google_map" style="height:300px"></div>

						<div class="block-group">
							<div class="block" style="width:50%">
                        		{$tbStore.info_text1}
							</div>
							<div class="block" style="width:50%">
								<br /><br />
								<div class="block-group">
									<div class="block" style="width:50%; padding: 10px;">
										<div class="panel">
											<div class="panel--header primary">Kontakt</div>
											<div class="panel--body">
												{if $tbStore.email_support}<a href="mailto:{$tbStore.email_support}">{$tbStore.email_support}</a><br />{/if}
												{if $tbStore.phone}Telefon: {$tbStore.phone}<br />{/if}
												{if $tbStore.fax}Telefon: {$tbStore.fax}<br />{/if}
											</div>
										</div>
									</div>
									<div class="block" style="width:50%; padding: 10px;">
										<div class="panel">
											<div class="panel--header primary">Öffnungseiten</div>
											<div class="panel--body">
												{$tbStore.info_opening_hours}
											</div>
										</div>
									</div>
									{if $tbStore.info_parking && $tbStore.info_parking!=''}
									<div class="block" style="width:100%; padding: 10px;">
										<div class="panel">
											<div class="panel--header primary">Anfahrt &amp; Parken</div>
											<div class="panel--body">
												{$tbStore.info_parking}
											</div>
										</div>
									</div>
									{/if}
									<div class="block" style="width:100%; padding: 10px;">
										<div class="panel">
											<div class="panel--header primary">Feedback</div>
											<div class="panel--body">
												{include file="frontend/filiale/feedback.tpl"}
											</div>
										</div>
									</div>
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
