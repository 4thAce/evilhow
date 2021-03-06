<?php

// $Id: dynamic_variables.php 13491 2008-07-10 09:20:32Z lphuberdeau $
// Copyright (c) 2002-2007, Luis Argerich, Garland Foster, Eduardo Polidor, et. al.
// All Rights Reserved. See copyright.txt for details and a complete list of authors.
// Licensed under the GNU LESSER GENERAL PUBLIC LICENSE. See license.txt for
// details.

//this script may only be included - so its better to die if called directly.
$access->check_script($_SERVER["SCRIPT_NAME"],basename(__FILE__));

// Check for an update of dynamic vars

if ( isset($tiki_p_edit_dynvar) && $tiki_p_edit_dynvar == 'y' ) {
    if ( isset($_REQUEST['_dyn_update']) ) {
        foreach ( $_REQUEST as $name => $value ) {
            if ( substr($name,0,4) == 'dyn_' and $name != '_dyn_update' ) {
                $tikilib->update_dynamic_variable(substr($name,4), $_REQUEST[$name]);
            }
        }
    }
}
