{* $Id: wikiplugin_subscribegroup.tpl 12560 2008-04-16 09:36:20Z sylvieg $ *}
{strip}
<form method="post">
<input type="hidden" name="group" value="{$subscribeGroup|escape}" />
{$text}
<div><input type="submit" name="subscribeGroup" value="{tr}{$action}{/tr}" /></div>
</form>
{/strip}