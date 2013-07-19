{* $Id: mod-last_modified_blogs.tpl 12615 2008-04-21 05:18:48Z chibaguy $ *}

{if $prefs.feature_blogs eq 'y'}
{if !isset($tpl_module_title)}
{if $nonums eq 'y'}
{eval var="{tr}Last `$module_rows` Modified blogs{/tr}" assign="tpl_module_title"}
{else}
{eval var="{tr}Last Modified blogs{/tr}" assign="tpl_module_title"}
{/if}
{/if}
{tikimodule title=$tpl_module_title name="last_modified_blogs" flip=$module_params.flip decorations=$module_params.decorations nobox=$module_params.nobox}
{if $nonums != 'y'}<ol>{else}<ul>{/if}
    {section name=ix loop=$modLastModifiedBlogs}
      <li>
        <a class="linkmodule" href="tiki-view_blog.php?blogId={$modLastModifiedBlogs[ix].blogId}">
            {$modLastModifiedBlogs[ix].title}
          </a>
        </li>
    {/section}
{if $nonums != 'y'}</ol>{else}</ul>{/if}
{/tikimodule}
{/if}
