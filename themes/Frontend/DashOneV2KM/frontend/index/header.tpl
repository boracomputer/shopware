{extends file='parent:frontend/index/header.tpl'}

{block name="frontend_index_header_css_ie" append}{strip}{literal}
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1637074749692388');
fbq('track', 'PageView');
{/literal}{if {controllerName|lower} == "detail"}
    fbq('track', 'ViewContent');
{/if}
{if {controllerName|lower} == "checkout" && $actionName=="finish"}
    fbq('track', 'Purchase', {value: '{$sAmountWithTax}', currency: 'EUR'});
{/if}
{if {controllerName|lower} == "register" && $actionName=="saveRegister"}
    fbq('track', 'CompleteRegistration');
{/if}
{if {controllerName|lower} == "search"}
    fbq('track', 'Search');
{/if}{literal}
</script>
<noscript>
 <img height="1" width="1"
src="https://www.facebook.com/tr?id=1637074749692388&ev=PageView
&noscript=1"/>
</noscript>
{/literal}{/strip}{/block}
