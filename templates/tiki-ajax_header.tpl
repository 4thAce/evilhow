{* $Id: tiki-ajax_header.tpl 13501 2008-07-10 13:46:35Z nyloth $ *}
{if $prefs.feature_ajax eq 'y'}

{$xajax_js}

<script type="text/javascript" src="lib/ajax/tiki-ajax.js"></script>

<div id="ajaxLoading">{tr}Loading...{/tr}</div>
<div id="ajaxDebug"></div>

{/if}
