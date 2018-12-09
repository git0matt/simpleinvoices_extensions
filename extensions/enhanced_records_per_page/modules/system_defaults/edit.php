<?php

/* modules/system_defaults/edit.php */
// stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();

global $get_val, $description, $LANG, $defaults, $value, $found;

switch ($get_val) {
  // @formatter:off
  /*case 'show_rp':
    $default     = $get_val;
    $description = "{$LANG[$default]}";
    $array       = array(0 => $LANG['disabled'], 1 => $LANG['enabled']);
    $value       = dropDown($array, $defaults[$default]);
    $found       = true;
    break;
*/
  case 'default_rp_invoices':
    $default     = $get_val;
//	$description = "abc";
    if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	elseif (isset($LANG['default_rp']) && isset($LANG['invoices']))
		$description = "{$LANG[default_rp]} ({$LANG[invoices]})";
	elseif (isset($LANG['default_rp']) && !isset($LANG['invoices']))
		$description = "{$LANG[default_rp]} (Invoices)";
	elseif (!isset($LANG['default_rp']) && isset($LANG['invoices']))
		$description = "Records per Page ({$LANG[invoices]})";
	else
		$description = "Records per Page (invoices)";
	$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
    $value       = dropDown($array, $defaults[$default]);
    $found       = true;
    break;

case 'default_rp_payments':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;

case 'default_rp_customers':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;

case 'default_rp_billers':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;

case 'default_rp_users':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
		$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;

case 'default_rp_products':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	$array       = array(0 => "{$LANG[disabled]}", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;

case 'default_rp_extensions':
	$default     = $get_val;
	if (isset($LANG[$default]))
		$description = "{$LANG[$default]}";
	$array       = array(0 => "Off", 10 => "10", 20 => "20", 30 => "30", 40 => "40");//, 60 => "60", 75 => "75", 100 => "100",  150 => "150", 300 => "300");
	$value       = dropDown($array, $defaults[$default]);
	$found       = true;
	break;
// @formatter:on
}
if ($description || $value || $found) {} // Here to stop unused variable warnings.
