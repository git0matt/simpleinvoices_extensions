<?php
global $LANG;
//echo str_replace(dirname($_SERVER['PHP_SELF']), "/", dirname(strstr(realpath(dirname(__FILE__)), dirname($_SERVER['PHP_SELF'])))). '/en_CA/lang.php';
// @formatter:off
$CLANG = array(
    'advanced' => "Advanced"
);
// @formatter:on
$LANG = array_merge($LANG,$CLANG);
