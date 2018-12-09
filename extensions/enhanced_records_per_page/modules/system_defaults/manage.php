<?php
/* modules/system_defaults/manage.php */
/*
global $smarty;

// stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();

// gets the long language name out of the short name
$lang = getDefaultLanguage();
$languages = getLanguageList();
foreach ($languages as $language) {
    if ($language->shortname == $lang) {
        $lang = $language->name;
        break;
    }
}

// @formatter:off
$smarty->assign("defaults"                , getSystemDefaults());
$smarty->assign("defaultBiller"           , Biller::getDefaultBiller());
$smarty->assign("defaultCustomer"         , Customer::getDefaultCustomer());
$smarty->assign("defaultTax"              , Taxes::getDefaultTax());
$smarty->assign("defaultPreference"       , Preferences::getDefaultPreference());

$smarty->assign("defaultPaymentType"      , PaymentType::getDefaultPaymentType());
$smarty->assign("defaultDelete"           , getDefaultDelete());
$smarty->assign("defaultLogging"          , getDefaultLogging());
$smarty->assign("defaultLanguage"         , $lang);

$smarty->assign("defaultInventory"        , getDefaultInventory());
$smarty->assign("defaultProductAttributes", getDefaultProductAttributes());
$smarty->assign("defaultLargeDataset"     , getDefaultLargeDataset());

$smarty->assign('pageActive', 'system_default');
$smarty->assign('active_tab', '#setting');
// @formatter:on
*/
require_once 'modules/system_defaults/manage.php';
/*
foreach ($ext_names as $ext_name) {
	if (file_exists("extensions/$ext_name/include/acl.php")) {
		require_once ("extensions/$ext_name/include/acl.php");
	}
}
*/
//$smarty->assign("defaultShow_rp", 		getDefaultGeneric('show_rp'));//getDefaultShow_rp());
if (isset($defaults['show_rp']))
	$smarty->assign("show_rp", 			$defaults['show_rp']);
//$smarty->assign("defaultDefault_rp", 	getDefaultGeneric('default_rp'));//getDefaultDefault_rp());
if (isset($defaults['default_rp']))
	$smarty->assign("default_rp", 		$defaults['default_rp']);

//if (isset($defaults['default_rp']['invoices']))
//	$smarty->assign("default_rp_invoices", 		$defaults['default_rp']['invoices']);

if (isset($defaults['default_rp_invoices']))
	$smarty->assign("default_rp_invoices", 		$defaults['default_rp_invoices']);
if (isset($defaults['default_rp_payments']))
	$smarty->assign("default_rp_payments", 		$defaults['default_rp_payments']);
if (isset($defaults['default_rp_customers']))
	$smarty->assign("default_rp_customers", 	$defaults['default_rp_customers']);
if (isset($defaults['default_rp_billers']))
	$smarty->assign("default_rp_billers", 		$defaults['default_rp_billers']);
if (isset($defaults['default_rp_users']))
	$smarty->assign("default_rp_users", 		$defaults['default_rp_users']);
if (isset($defaults['default_rp_products']))
	$smarty->assign("default_rp_products", 		$defaults['default_rp_products']);
if (isset($defaults['default_rp_extensions']))
	$smarty->assign("default_rp_extensions", 	$defaults['default_rp_extensions']);
