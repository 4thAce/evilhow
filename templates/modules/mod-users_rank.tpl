{* $Id: mod-users_rank.tpl 12615 2008-04-21 05:18:48Z chibaguy $ *}

{if $prefs.feature_score eq 'y'}
{if !isset($tpl_module_title)}{assign var=tpl_module_title value="{tr}Top users{/tr}"}{/if}
{tikimodule title=$tpl_module_title name="users_rank" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
{if $nonums != 'y'}<ol>{else}<ul>{/if}
{section loop=$users_rank name=u}
  <li>
    <div class="licomponent" style="display:inline">{$users_rank[u].position})&nbsp;</div>
    <div class="licomponent" style="display:inline">{$users_rank[u].score}</div>
    <div class="licomponent" style="display:inline">&nbsp;{$users_rank[u].login|userlink}</div>
  </li>
{/section}
{if $nonums != 'y'}</ol>{else}</ul>{/if}
<a style="margin-left: 20px" href="tiki-list_users.php">{tr}More{/tr}...</a>

{/tikimodule}
{/if}
