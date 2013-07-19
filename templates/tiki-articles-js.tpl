{* $Id: tiki-articles-js.tpl 12998 2008-05-27 17:07:11Z sept_7 $ *}
<script type="text/javascript">
<!--//--><![CDATA[//><!--
        var articleTypes = new Array();
{foreach from=$types key=type item=properties}


        typeProp = new Array();

    {foreach from=$properties key=prop item=value}
        typeProp['{$prop|escape}'] = '{$value|escape}';
    {/foreach}

        articleTypes['{$type|escape}'] = typeProp;
{/foreach}
//--><!]]>
</script>
        
