{* $Id: tiki-admin_system.tpl 14403 2008-08-18 21:01:53Z ricks99 $ *}
<h1><a class="pagetitle" href="tiki-admin_system.php">{tr}System Admin{/tr}</a>

{if $prefs.feature_help eq 'y'}
<a href="{$prefs.helpurl}System+Admin" target="tikihelp" class="tikihelp" title="{tr}system admin{/tr}">
{icon _id='help'}</a>{/if}
{if $prefs.feature_view_tpl eq 'y'}
<a href="tiki-edit_templates.php?template=tiki-admin_system.tpl" target="tikihelp" class="tikihelp" title="{tr}View tpl{/tr}: {tr}system admin tpl{/tr}">
{icon _id='shape_square_edit' alt='{tr}Edit template{/tr}'}</a>{/if}</h1>

{remarksbox type="tip" title="{tr}Tip{/tr}"}{tr}If your Tiki is acting weird, first thing to try is to clear your cache below. Also very important is to clear your cache after an upgrade (by FTP/SSH when needed).{/tr}{/remarksbox}

<h2>{tr}Exterminator of cached content{/tr}</h2>
<table class="normal">
<tr><th class="heading">{tr}Directory{/tr}</th><th>{tr}Files{/tr}/{tr}Size{/tr}</th><th>{tr}Action{/tr}</th></tr>
<tr class="form">
<td class="odd"><b>./templates_c/</b></td>
<td class="odd">({$templates_c.cant} {tr}Files{/tr} / {$templates_c.total|kbsize|default:'0 Kb'})</td>
<td class="odd"><a href="tiki-admin_system.php?do=templates_c" class="link" title="{tr}Empty{/tr}">{icon _id=img/icons/del.gif alt="{tr}Empty{/tr}"}</a></td>
</tr>
<tr class="form">
<td class="even"><b>./modules/cache/</b></td>
<td class="even">({$modules.cant} {tr}Files{/tr} / {$modules.total|kbsize|default:'0 Kb'})</td>
<td class="even"><a href="tiki-admin_system.php?do=modules_cache" class="link" title="{tr}Empty{/tr}">{icon _id=img/icons/del.gif alt="{tr}Empty{/tr}"}</a></td>
</tr>
<tr class="form">
<td class="odd"><b>./temp/cache/</b></td>
<td class="odd">({$tempcache.cant} {tr}Files{/tr} / {$tempcache.total|kbsize|default:'0 Kb'})</td>
<td class="odd"><a href="tiki-admin_system.php?do=temp_cache" class="link" title="{tr}Empty{/tr}">{icon _id=img/icons/del.gif alt="{tr}Empty{/tr}"}</a></td>
</tr>
<tr class="form">
<td class="even" colspan="2"><b>{tr}All user prefs sessions{/tr}</b></td>
<td class="even"><a href="tiki-admin_system.php?do=prefs" class="link" title="{tr}Empty{/tr}">{icon _id=img/icons/del.gif alt="{tr}Empty{/tr}"}</a></td>
</tr>
</table>
<br />
{if count($dirs)}
<div class="cbox">
<div class="cbox-title">{tr}Directories to save:{/tr}</div>
<div class="cbox-data"> 
<ul>
{foreach from=$dirs item=d}
	<li>{$d}</li>
{/foreach}
</ul>
</div>
</div>
{/if}

{if count($templates)}
<br />
<h2>{tr}Templates compiler{/tr}</h2>
<table class="sortable" id="templatecompiler" width="100%">
<tr>
<th class="heading">{tr}Language{/tr}</th>
<th class="heading">{tr}Pages{/tr}/{tr}Size{/tr}</th>
<th class="heading">{tr}Action{/tr}</th>
</tr>
{cycle values="even,odd" print=false}
{foreach key=key item=item from=$templates}
<tr class="form">
<td class="{cycle advance=false}"><b>{$key}</b></td>
<td class="{cycle}">({$item.cant} {tr}Files{/tr} / {$item.total|kbsize|default:'0 Kb'})</td>
<td class="{cycle advance=false}"><a href="tiki-admin_system.php?compiletemplates={$key}" class="link">{tr}Compile{/tr}</a></td>
</tr>
{/foreach}
</table>
{/if}
<br />

{if $tiki_p_admin eq 'y'}
<div class="advanced">{tr}Advanced feature{/tr}: {tr}Fix UTF-8 Errors in Tables{/tr}:
<a href="javascript:toggle('fixutf8')">{tr}Show{/tr}/{tr}Hide{/tr}</a>
<br /><br />
<div id="fixutf8" {if $advanced_features ne 'y'}style="display:none;"{else}style="display:block;"{/if}>
<h2>{tr}Fix UTF-8 Errors in Tables{/tr}</h2>
<table class="normal">
<tr><td class="form" colspan="4">{tr}Warning: Make a backup of your Database before using this function!{/tr}</td></tr>
<tr><td class="form" colspan="4">{tr}Warning: If you try to convert large tables, raise the maximum execution time in your php.ini!{/tr}</td></tr>
<tr><td class="form" colspan="4">{tr}This function converts ISO-8859-1 encoded strings in your tables to UTF-8{/tr}</td></tr>
<tr><td class="form" colspan="4">{tr}This may be necessary if you created content with tiki &lt; 1.8.4 and Default Charset settings in apache set to ISO-8859-1{/tr}</td></tr>
<tr><td colspan="4">&nbsp;</td></tr>
{if isset($utf8it)}
<tr><td>{$utf8it}</td><td>{$utf8if}</td><td colspan="2">{$investigate_utf8}</td></tr>
{/if}
{if isset($utf8ft)}
<tr><td>{$utf8ft}</td><td>{$utf8ff}</td><td colspan="2">{$errc} {tr}UTF-8 Errors fixed{/tr}</td></tr>
{/if}
</table>
<table class="sortable" id="tablefix" width="100%">
<tr><th class="heading">{tr}Table{/tr}</th><th class="heading">{tr}Field{/tr}</th><th class="heading">{tr}Investigate{/tr}</th><th class="heading">{tr}Fix it{/tr}</th></tr>
{cycle values="even,odd" print=false}
{foreach key=key item=item from=$tabfields}
<tr><td class="{cycle advance=false}">{$item.table}</td><td class="{cycle advance=false}">{$item.field}</td>
<td class="{cycle advance=false}"><a href="tiki-admin_system.php?utf8it={$item.table}&amp;utf8if={$item.field}" class="link">{tr}Investigate{/tr}</a></td>
<td class="{cycle}"><a href="tiki-admin_system.php?utf8ft={$item.table}&amp;utf8ff={$item.field}" class="link">{tr}Fix it{/tr}</a></td>
</tr>
{/foreach}
</table>
</div>
</div>
{/if}
