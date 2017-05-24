{extends file="frontend/index/index.tpl"}

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
    var filialen={$tbStoresJSON};
    var shopname, shopmarker;
    var markers = [];
    var options = {
	        zoom: 5,
	        mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: new google.maps.LatLng(50.979182,6.574888)
    };
    var infowindow   = new google.maps.InfoWindow();
    var geocoder     = new google.maps.Geocoder();
    var googlemap    = new google.maps.Map(
                            document.getElementById("google_map"),
                            options
                        );
{literal}
//console.log(shopmarker_bora);

    $.each(filialen, function(k, v){

        if(v.shopID=="1"){
            shopname = 'Bora Computer';
            shopmarker = '//bora-computer.de/media/image/google_marker_bora.png';
        }
        else{
            shopname = 'K&M Computer';
            shopmarker = '//www.kmcomputer.de/media/image/google_marker_km.png';
        }
	            markers[v.id] = new google.maps.Marker({
	                map: googlemap,
	                position: {lat: parseFloat(v.lat), lng: parseFloat(v.lng)},
                    title: shopname+' - ' + v.name,
                    icon: shopmarker
	            });

                google.maps.event.addListener(markers[v.id], 'click', function(){
                    var content = ''
                    +'<h3 id="firstHeading" class="firstHeading">'+this.title+'</h3>'
                    +'<div id="bodyContent">'
                    +'<p>'+v.address+'</p>'
                    +'<p>'+v.info+'</p>'
                    +'</div>';

                    infowindow.setContent(content);
                    infowindow.open(googlemap,markers[v.id]);
                });

    });

    $('.toggle-marker').click(function(){
        google.maps.event.trigger( markers[$(this).data('fid')], 'click' );
        googlemap.setZoom(15);
    })
});
{/literal}
</script>
{/block}


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

{*block name='frontend_custom_article_title'}
    <div class="panel-heading">
        <h1 class="panel-title">Unsere Filialen im Überblick</h1>
    </div>
{/block}

{block name='frontend_custom_article_content'}
<div class="panel">
    <div class="panel-body">
        <div id="google_map" style="height: 400px;"></div>
    </div>
</div>

<div class="col-sm-6">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Bora Computer Onlineshop</h3>
        </div>
        <div class="panel-body">
            <div class="singlefiliale" style="width:379px; margin: 10px 5px; float: left;">
                <p>Josef Schregel Stra&szlig;e 17a<br />
                    52349 D&uuml;ren</p>
                <p>Telefon: 0180 / 5 33 66 36 **<br />
                    Fax: 02421 / 95205 99</p>
                <p>E-Mail: support@bora-computer.de</p>
                <p>Telefonisch erreichbar:<br />
                    Mo. - Fr.: 09.30 - 18.30 Uhr</p>
            </div>
        </div>
    </div>
</div>
{foreach from=$sFilialen key=i item=filiale}
{if $filiale.shopID==1}
    {$shopname = 'Bora Computer'}
    {$marker = '//www.kmcomputer.de/media/image/google_marker_bora.png'}
    {$style = ''}
{elseif $filiale.shopID==5}
    {$shopname = 'K&M Computer'}
    {$marker = '//www.kmcomputer.de/media/image/google_marker_km.png'}
    {$style = ' style="background:#129DD9;"'}
{/if}
<div class="col-sm-6">
    <div class="panel panel-primary">
        <div class="panel-heading"{$style}>
            <h3 class="panel-title">{$shopname} {$filiale.name|utf8_decode} <a href="#wrapper" data-fid="{$filiale.id}" style="position: absolute; right: 0px; top: -10px;" class="toggle-marker"><img src="{$marker}" /></a></h3>
        </div>
        <div class="panel-body">
            <div class="singlefiliale" style="width:379px; margin: 10px 5px; float: left;">
                <p>{$filiale.address|nl2br}</p>
                <p>{$filiale.info|nl2br}</p>
            </div>
        </div>
    </div>
</div>
{/foreach}
<div class="clear"></div>
{/block*}
