{* $Id: footer.tpl 13854 2008-07-23 20:11:18Z nyloth $ *}
<!-- Start of StatCounter Code -->
{literal}<script type="text/javascript">
var sc_project=4039580;
var sc_invisible=0;
var sc_partition=46;
var sc_click_stat=1;
var sc_security="15477941";
</script>

<script type="text/javascript" src="http://www.statcounter.com/counter/counter.js"></script><noscript><div class="statcounter"><a title="hit counter" href="http://www.statcounter.com/free_hit_counter.html" target="_blank"><img class="statcounter" src="http://c.statcounter.com/4039580/0/15477941/0/" alt="hit counter" ></a></div></noscript>
<!-- End of StatCounter Code -->{/literal}
{if (! isset($display) or $display eq '')}
{if count($phpErrors)}
<span class="button2"><a href="#" onclick="flip('errors');return false;" class="linkbut">{tr}Show php error messages{/tr}</a></span><br />
<div id="errors" style="display:{if isset($smarty.session.tiki_cookie_jar.show_errors) and $smarty.session.tiki_cookie_jar.show_errors eq 'y'}block{else}none{/if};">
{foreach item=err from=$phpErrors}{$err}{/foreach}
</div>
{/if}

{if $tiki_p_admin eq 'y' and $prefs.feature_debug_console eq 'y'}
  {* Include debugging console. Note it shoudl be processed as near as possible to the end of file *}

  {php}  include_once("tiki-debug_console.php"); {/php}
  {include file="tiki-debug_console.tpl"}

{/if}
{if $prefs.feature_phplayers eq 'y' and isset($phplayers_LayersMenu)}
	{$phplayers_LayersMenu->printHeader()}
	{$phplayers_LayersMenu->printFooter()}
{/if}

{if $lastup}
<div class="cvsup" style="font-size:x-small;text-align:center;color:#999;">{tr}Last update from SVN{/tr}({$prefs.tiki_version}): {$lastup|tiki_long_datetime}</div>
{/if}
{/if}
</body>
</html>  
