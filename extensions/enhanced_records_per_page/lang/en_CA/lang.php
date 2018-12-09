<?php
global $LANG;

// @formatter:off
$MY_LANG = array(
    //'show_rp' =>                    "Show Rows/Page select box",
	//'default_rp' =>					"Default number of Rows/Page",
	'default_rp_invoices' =>		"Default number of Rows/Page (Invoices)",
	'default_rp_payments' =>		"Default number of Rows/Page (Payments)",
	'default_rp_customers' =>		"Default number of Rows/Page (Customers)",
	'default_rp_billers' =>			"Default number of Rows/Page (Billers)",
	'default_rp_users' =>			"Default number of Rows/Page (Users)",
	'default_rp_products' =>		"Default number of Rows/Page (Products)",
	'default_rp_extensions' =>		"Default number of Rows/Page (Extensions)",
    'user_id' =>                    "User ID"
);
// @formatter:on
global $defaults;

$LANG = array_merge($LANG, $MY_LANG);
