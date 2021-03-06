{* $Id: tiki-mods_admin.tpl 12246 2008-03-30 13:41:44Z luciash $ *}
<h1><a href="tiki-mods_admin.php" class="pagetitle">{tr}Tikiwiki Mods Configuration{/tr}</a></h1>
<div class="navbar"><span class="button2"><a href="tiki-mods.php" class="linkbut">{tr}Mods Install/uninstall{/tr}</a></span></div>

{section name=n loop=$tikifeedback}<div class="simplebox{if $tikifeedback[n].num > 0} highlight{/if}">{$tikifeedback[n].mes}</div>{/section}

<form method="post" action="tiki-mods_admin.php">

<table class="form">
<tr class="formrow">
<td>{tr}Enable Mods providing{/tr}</td>
<td><input type="checkbox" name="feature_mods_provider" value="on"{if $prefs.feature_mods_provider eq 'y'} checked="checked"{/if} /></td>
</tr>
<tr class="formrow">
<td>{tr}Mods local directory{/tr}</td>
<td><input type="text" name="mods_dir" value="{$prefs.mods_dir}" size="42" /></td>
</tr>
<tr class="formrow">
<td>{tr}Mods remote server{/tr}</td>
<td><input type="text" name="mods_server" value="{$prefs.mods_server}" size="42" /></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="save" value="{tr}Save{/tr}" /></td>
</tr>
</table>

</form>

<br /><br />

