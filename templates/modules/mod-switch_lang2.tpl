{* $Id: mod-switch_lang2.tpl 12675 2008-04-24 20:35:32Z pkdille $ *}

{if !isset($tpl_module_title)}{assign var=tpl_module_title value="{tr}Site Language:{/tr}&nbsp;`$prefs.language`"}{/if}
{tikimodule title=$tpl_module_title name="switch_lang2" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
{section name=ix loop=$languages}
  <td align="center">
    <a title="{$languages[ix].name|escape}" class="linkmodule" href="tiki-switch_lang.php?language={$languages[ix].value|escape}">
      {$languages[ix].display|escape}
    </a>
  </td>
  {if not ($smarty.section.ix.rownum mod 3)}
    {if not $smarty.section.ix.last}
      </tr><tr>
    {/if}
  {/if}
{/section}
</tr></table>
{/tikimodule}
