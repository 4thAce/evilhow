{* $Id: mod-categories.tpl 13501 2008-07-10 13:46:35Z nyloth $ *}
{if !isset($tpl_module_title)}{eval assign=tpl_module_title var="{tr}Categories{/tr}"}{/if}
{tikimodule title=$tpl_module_title name="categories" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
{$module_error}
{$tree}
{/tikimodule}

