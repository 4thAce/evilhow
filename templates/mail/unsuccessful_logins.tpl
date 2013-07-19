{* $Id: unsuccessful_logins.tpl 12240 2008-03-30 13:12:49Z luciash $ *}
{$msg}
{tr}Please visit this link before login again:{/tr}
{$mail_machine}?user={$user|escape:'url'}&pass={$mail_apass}