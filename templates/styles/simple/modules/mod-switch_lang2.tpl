{* $Id: mod-switch_lang2.tpl 13501 2008-07-10 13:46:35Z nyloth $ *}

{tikimodule title="{tr}Language{/tr}: `$prefs.language`" name="switch_lang2"}
<ul class='floatlist'>
{capture}{$languages|@sort}{/capture}{* use php sort() as modifier for the array and do not print the '1' *}
{section name=ix loop=$languages}
  <li>
    <a title="{$languages[ix].name|escape}" class="linkmodule" href="tiki-switch_lang.php?language={$languages[ix].value|escape}">
      {$languages[ix].display|escape}
    </a>
  </li>
{/section}
</ul>
{/tikimodule}
