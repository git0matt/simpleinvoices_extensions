<?php
/**********
Script: ./extensions/enhanced_ship_to/include/init.php
Initialization

Last edited:
2018-12-08	git0matt@gmail.com
**********/

//if (!isset($s2abs))
//{
//	$s2abs = realpath(dirname(__FILE__));
//	$s2rel = str_replace(dirname($_SERVER['PHP_SELF']), ".", dirname(strstr($s2abs, dirname($_SERVER['PHP_SELF'])))). '/';
	set_include_path(get_include_path(). PATH_SEPARATOR. realpath(dirname(__FILE__)). "/class");	// load classes on-demand
	//error_log("include path appended: ${s2abs}/class");
//}
//error_log('ShipTo: init');
