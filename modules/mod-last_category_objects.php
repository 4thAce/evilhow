<?php
// $Id: mod-last_category_objects.php 12270 2008-03-30 20:06:05Z luciash $

//this script may only be included - so its better to die if called directly.
if (strpos($_SERVER["SCRIPT_NAME"],basename(__FILE__)) !== false) {
  header("location: index.php");
  exit;
}

if (!isset($module_params["type"])) {
	$module_params["type"] = "wiki page";
}
if ($module_params["type"] == '*') {
	$module_params["type"] = '';
}
if (!isset($module_params["id"])) {
	$last["data"][]['name'] = tra("Please provide an Id");
} else {
	global $categlib;
	if (!is_object($categlib)) {
		require_once ("lib/categories/categlib.php");
	}
	$last = $categlib->last_category_objects($module_params["id"],$module_rows,$module_params["type"]);
}
if (!is_array($last) or !is_array($last['data'])) {
	$last['data'][]['name'] = tra("no object here yet");
}
$smarty->assign('last',$last['data']);
$smarty->assign('type',$module_params["type"]);
?>
