<?php

// $Id: set_paths.php 13491 2008-07-10 09:20:32Z lphuberdeau $
// Copyright (c) 2002-2007, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for
// details.

//this script may only be included - so its better to die if called directly.
$access->check_script($_SERVER["SCRIPT_NAME"],basename(__FILE__));

/* Automatically set params used for absolute URLs - BEGIN */

$tmp = dirname(str_replace(dirname(dirname(dirname(__FILE__))),'',$_SERVER['SCRIPT_FILENAME']));
if ($tmp != '/') {
        $dir_level = substr_count($tmp,"/");
} else {
        $dir_level = 0;
}
unset($tmp);

$tikiroot = dirname($_SERVER['PHP_SELF']);
if ("\\" == $tikiroot) $tikiroot="/"; // even onv windows / is used!
$tikipath = dirname($_SERVER['SCRIPT_FILENAME']);

if ($dir_level > 0) {
        $tikiroot = preg_replace('#(/[^/]+){'.$dir_level.'}$#','',$tikiroot);
        $tikipath = preg_replace('#(/[^/]+){'.$dir_level.'}$#','',$tikipath);
        chdir(join('../',array_fill(0,$dir_level+1,'')));
}

if ( substr($tikiroot,-1,1) != '/' ) $tikiroot .= '/';
if ( substr($tikipath,-1,1) != '/' ) $tikipath .= '/';
