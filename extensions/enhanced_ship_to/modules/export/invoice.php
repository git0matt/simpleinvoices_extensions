<?php
/*
 *  Script: template.php
 *      invoice export page
 *
 *  License:
 *      GPL v3 or above
 *
 *  Website:
 *      https://simpleinvoices.group
 */
	require str_replace(dirname($_SERVER['PHP_SELF']), "/", dirname(strstr(realpath(dirname(__FILE__)), dirname($_SERVER['PHP_SELF'])))). '/../include/class/st_export.php';
	//include './extensions/enhanced_ship_to/modules/export/st_export.php';
$export            = new st_export();
$export->id        = (isset($_GET['id']      ) ? $_GET['id']       : "");
$export->format    = (isset($_GET['format']  ) ? $_GET['format']   : "");
$export->file_type = (isset($_GET['filetype']) ? $_GET['filetype'] : "");
$export->module    = 'invoice';
$export->setDownload(true);
$export->execute();
