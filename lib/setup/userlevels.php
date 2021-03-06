<?php

// $Id: userlevels.php 13491 2008-07-10 09:20:32Z lphuberdeau $
// Copyright (c) 2002-2007, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for
// details.

//this script may only be included - so its better to die if called directly.
$access->check_script($_SERVER["SCRIPT_NAME"],basename(__FILE__));

$mylevel = $tikilib->get_user_preference($user,'mylevel',1);
if ( isset($_REQUEST['level']) and isset($prefs['userlevels'][$_REQUEST['level']]) and $user ) {
	$tikilib->set_user_preference($user,"mylevel",$_REQUEST['level']);
	$mylevel = $_REQUEST['level'];
}
$smarty->assign('mylevel',$mylevel);
