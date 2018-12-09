<?php
global $LANG;
//echo str_replace(dirname($_SERVER['PHP_SELF']), "/", dirname(strstr(realpath(dirname(__FILE__)), dirname($_SERVER['PHP_SELF'])))). '/en_CA/lang.php';
// @formatter:off
$CLANG = array(
    'people' => "Organisations",
	'0settings_lower' => "Settings",
    '0settings'   => "Extra"
);
// @formatter:on
$LANG = array_merge($LANG,$CLANG);
