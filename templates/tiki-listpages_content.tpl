{* $Id: tiki-listpages_content.tpl 13463 2008-07-08 12:34:41Z pkdille $ *}

{if $cant_pages > 1 or $initial or $find}{initials_filter_links}{/if}

{if $tiki_p_remove eq 'y' or $prefs.feature_wiki_multiprint eq 'y'}
  {assign var='checkboxes_on' value='y'}
{else}
  {assign var='checkboxes_on' value='n'}
{/if}

{if $checkboxes_on eq 'y'}
  <form name="checkboxes_on" method="post" action="{$smarty.server.PHP_SELF}">
{/if}
  
<table class="normal">
  <tr>
    {if $checkboxes_on eq 'y' && count($listpages) > 0}
      <td class="heading">
      {if $prefs.javascript_enabled eq 'y'}
        <input name="switcher" id="clickall" type="checkbox" title="Select All" onclick="switchCheckboxes(this.form,'checked[]',this.checked)"/>
      {/if}
      </td>
      {assign var='cntcol' value='1'}
    {else}
      {assign var='cntcol' value='0'}
    {/if}
  

    {if $prefs.wiki_list_id eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='page_id'}{tr}Id{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_name eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='pageName'}{tr}Page{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_hits eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading" style="text-align:right;">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='hits'}{tr}Hits{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_lastmodif eq 'y' or $prefs.wiki_list_comment eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">
      {assign var='lastmod_sortfield' value='lastModif'}
      {assign var='lastmod_shorttitle' value='{tr}Last mod{/tr}'}
      {if $prefs.wiki_list_lastmodif eq 'y' and $prefs.wiki_list_comment eq 'y'}
        {assign var='lastmod_title' value='{tr}Last modification{/tr} / {tr}Comment{/tr}'}
      {elseif $prefs.wiki_list_lastmodif eq 'y'}
        {assign var='lastmod_title' value='{tr}Last modification{/tr}'}
      {else}
        {assign var='lastmod_title' value='{tr}Comment{/tr}'}
        {assign var='lastmod_sortfield' value='comment'}
        {assign var='lastmod_shorttitle' value='{tr}Comment{/tr}'}
      {/if}
      {self_link _class='tableheading' _sort_arg='sort_mode' _sort_field=$lastmod_sortfield _title=$lastmod_title}{$lastmod_shorttitle}{/self_link}
      </td>
    {/if}

    {if $prefs.wiki_list_creator eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='creator' _title='{tr}Page creator{/tr}'}{tr}Creator{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_user eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='user' _title='{tr}Last author{/tr}'}{tr}Last author{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_lastver eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='version' _title='{tr}Last version{/tr}'}{tr}Last ver.{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_status eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td style="text-align:center;" class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='flag' _icon='lock_gray'}{tr}Status of the page{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_versions eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='versions' _title='{tr}Versions{/tr}'}{tr}Vers.{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_links eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='links' _title='{tr}Links to other items in page{/tr}'}{tr}Links{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_backlinks eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='backlinks' _title='{tr}Links to this page in other pages{/tr}'}{tr}Backl.{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_size eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='size' _title='{tr}Page size{/tr}'}{tr}Size{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_language eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{self_link _class='tableheading' _sort_arg='sort_mode' _sort_field='lang' _title='{tr}Language{/tr}'}{tr}Lang.{/tr}{/self_link}</td>
    {/if}

    {if $prefs.wiki_list_categories eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{tr}Categories{/tr}</td>
    {/if}

    {if $prefs.wiki_list_categories_path eq 'y'}
      {assign var='cntcol' value=$cntcol+1}
      <td class="heading">{tr}Categories{/tr}</td>
    {/if}

    {if $tiki_p_edit eq 'y' or $tiki_p_assign_perm_wiki_page eq 'y'}
      <td class="heading">Action</td>
    {/if}
  </tr>

  {cycle values="even,odd" print=false}
  {section name=changes loop=$listpages}
  <tr>
    {if $checkboxes_on eq 'y'}
      <td class="{cycle advance=false}">
        <input type="checkbox" name="checked[]" value="{$listpages[changes].pageName|escape}"/>
      </td>
    {/if}

    {if $prefs.wiki_list_id eq 'y'}
      <td class="{cycle advance=false}">
        <a href="{$listpages[changes].pageName|sefurl}" class="link" title="{tr}View page{/tr}&nbsp;{$listpages[changes].pageName}">{$listpages[changes].page_id}</a>
      </td>
    {/if}

    {if $prefs.wiki_list_name eq 'y'}
      <td class="{cycle advance=false}">
        <a href="{$listpages[changes].pageName|sefurl}" class="link" title="{tr}View page{/tr}&nbsp;{$listpages[changes].pageName}">{$listpages[changes].pageName|truncate:$prefs.wiki_list_name_len:"...":true}</a>
        {if $prefs.wiki_list_description eq 'y' && $listpages[changes].description neq ""}
          <div class="subcomment">
            {$listpages[changes].description|truncate:$prefs.wiki_list_description_len:"...":true}
          </div>
        {/if}
      </td>
    {/if}

    {if $prefs.wiki_list_hits eq 'y'}	
      <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].hits}</td>
    {/if}

    {if $prefs.wiki_list_lastmodif eq 'y' or $prefs.wiki_list_comment eq 'y'}
      <td class="{cycle advance=false}">
        {if $prefs.wiki_list_lastmodif eq 'y'}
          <div>{$listpages[changes].lastModif|tiki_short_datetime}</div>
        {/if}
        {if $prefs.wiki_list_comment eq 'y' && $listpages[changes].comment neq ""}
          <div><i>{$listpages[changes].comment|truncate:$prefs.wiki_list_comment_len:"...":true}</i></div>
        {/if}
      </td>
    {/if}

    {if $prefs.wiki_list_creator eq 'y'}
      <td class="{cycle advance=false}">{$listpages[changes].creator|userlink}</td>
    {/if}

    {if $prefs.wiki_list_user eq 'y'}
      <td class="{cycle advance=false}">{$listpages[changes].user|userlink}</td>
    {/if}

    {if $prefs.wiki_list_lastver eq 'y'}
      <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].version}</td>
    {/if}

    {if $prefs.wiki_list_status eq 'y'}
      <td style="text-align:center;" class="{cycle advance=false}">
        {if $listpages[changes].flag eq 'locked'}
	  {icon _id='lock' alt='{tr}Locked{/tr}'}
	{else}
	  {icon _id='lock_break' alt='{tr}unlocked{/tr}'}
	{/if}
      </td>
    {/if}

    {if $prefs.wiki_list_versions eq 'y'}
      {if $prefs.feature_history eq 'y' and $tiki_p_wiki_view_history eq 'y'}
        <td style="text-align:right;" class="{cycle advance=false}">
          <a class="link" href="tiki-pagehistory.php?page={$listpages[changes].pageName|escape:"url"}">{$listpages[changes].versions}</a>
        </td>
      {else}
        <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].versions}</td>
      {/if}
    {/if}

    {if $prefs.wiki_list_links eq 'y'}
      <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].links}</td>
    {/if}

    {if $prefs.wiki_list_backlinks eq 'y'}
      {if $prefs.feature_backlinks eq 'y'}
        <td style="text-align:right;" class="{cycle advance=false}">
          <a class="link" href="tiki-backlinks.php?page={$listpages[changes].pageName|escape:"url"}">{$listpages[changes].backlinks}</a>
        </td>
      {else}
        <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].backlinks}</td>
      {/if}
    {/if}

    {if $prefs.wiki_list_size eq 'y'}
      <td style="text-align:right;" class="{cycle advance=false}">{$listpages[changes].len|kbsize}</td>
    {/if}

    {if $prefs.wiki_list_language eq 'y'}
      <td class="{cycle advance=false}">{$listpages[changes].lang}</td>
    {/if}

    {if $prefs.wiki_list_categories eq 'y'}
      <td class="{cycle advance=false}">
        {foreach item=categ from=$listpages[changes].categname name=categ}
	  {if !$smarty.foreach.categ.first}<br />{/if}
	    {$categ}
	{/foreach}
      </td>
    {/if}

    {if $prefs.wiki_list_categories_path eq 'y'}
      <td class="{cycle advance=false}">
	{foreach item=categpath from=$listpages[changes].categpath}
          {if !$smarty.foreach.categpath.first}<br />{/if}
	    {$categpath}
	{/foreach}
      </td>
    {/if}

    {if $tiki_p_edit eq 'y' or $tiki_p_assign_perm_wiki_page eq 'y'}
      <td class="{cycle advance=false}">
  
      {if $tiki_p_edit eq 'y'}
        <a class="link" href="tiki-editpage.php?page={$listpages[changes].pageName|escape:"url"}">{icon _id='page_edit'}</a>
      {/if}

      {if $prefs.feature_history eq 'y' and $tiki_p_wiki_view_history eq 'y'}
        <a class="link" href="tiki-pagehistory.php?page={$listpages[changes].pageName|escape:"url"}">{icon _id='page_white_stack' alt='{tr}History{/tr}'}</a>
      {/if}
  
      {if $tiki_p_assign_perm_wiki_page eq 'y'}
        <a class="link" href="tiki-objectpermissions.php?objectName={$listpages[changes].pageName|escape:"url"}&amp;objectType=wiki+page&amp;permType=wiki&amp;objectId={$listpages[changes].pageName|escape:"url"}">{icon _id='key' alt='{tr}Perms{/tr}'}</a>
      {/if}

      {if $tiki_p_remove eq 'y'}
        <a class="link" href="tiki-removepage.php?page={$listpages[changes].pageName|escape:"url"}&amp;version=last">{icon _id='cross' alt='{tr}Remove{/tr}'}</a>
      {/if}
  
      </td>
    {/if}
    
    {cycle print=false}
  </tr>
  {sectionelse}

  <tr>
    <td colspan="{$cntcol}">
      <b>{tr}No records found{/tr}</b>
    </td>
  </tr>
  {/section}

</table>

  {if $checkboxes_on eq 'y' && count($listpages) > 0} {* what happens to the checked items? *}
    <p align="left"> {*on the left to have it close to the checkboxes*}
	{tr}Perform action with checked{/tr}:
      <select name="submit_mult" onchange="this.form.submit();">
        <option value="" selected="selected">...</option>
        {if $tiki_p_remove eq 'y'} 
        	<option value="remove_pages" >{tr}Remove{/tr}</option>
        {/if}
    
        {if $prefs.feature_wiki_multiprint eq 'y'}
        	<option value="print_pages" >{tr}Print{/tr}</option>
        {/if}

	{if $prefs.feature_wiki_usrlock eq 'y' and ($tiki_p_lock eq 'y' or $tiki_p_admin_wiki eq 'y')}
		<option value="lock_pages" >{tr}Lock{/tr}</option>
		<option value="unlock_pages" >{tr}Unlock{/tr}</option>
	{/if}
      
        {* add here e.g. <option value="categorize" >{tr}categorize{/tr}</option> *}
      </select>                
    
      <script type='text/javascript'>
        <!--
        // Fake js to allow the use of the <noscript> tag (so non-js-users can still submit)
        //-->
      </script>
    
      <noscript>
        <input type="submit" value="{tr}OK{/tr}" />
      </noscript>
    </p>
  {/if}
  {if $find && $tiki_p_edit eq 'y'}{tr}Create Page{/tr}: <a href="tiki-editpage.php?page={$find}" title="{tr}Create{/tr}"> {$find}</a>{/if}

</form>

<br />
{pagination_links cant=$cant step=$maxRecords offset=$offset}{/pagination_links}
