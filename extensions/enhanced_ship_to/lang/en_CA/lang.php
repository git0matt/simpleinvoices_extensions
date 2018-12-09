<?php
global $LANG;
//echo str_replace(dirname($_SERVER['PHP_SELF']), "/", dirname(strstr(realpath(dirname(__FILE__)), dirname($_SERVER['PHP_SELF'])))). '/en_CA/lang.php';
// @formatter:off
$CLANG = array(
    'ship_to' => "Ship to",
    'ship_to_customer'   => "ship_to_customer"
);
// @formatter:on
$LANG = array_merge($LANG,$CLANG);
