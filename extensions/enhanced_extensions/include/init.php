<?php
global $patchCount, $help_image_path, $zendDb;

//error_log('loading extensions/enhanced_extensions');

//if ($patchCount >= "293") {
	//include_once './extensions/enhanced_extensions/include/sql_queries.php';
	#	include_once './extensions/enhanced_extensions/include/class/enhanced_extensions.php';
	//RowsPerPage::addUserName();
	//RowsPerPage::addSystemDefaultFields();
/*
	// @formatter:off
	$session_timeout = $zendDb->fetchRow("SELECT value
										  FROM ". TB_PREFIX."system_defaults
										  WHERE name='session_timeout'");
	// @formatter:on
	$timeout = intval($session_timeout['value']);
	if ($timeout <= 0) {
	  $timeout = 60;
	}

	// Chuck the user details sans password into the Zend_auth session
	$authNamespace = new Zend_Session_Namespace('Zend_Auth');
	$authNamespace->setExpirationSeconds($timeout * 60);

	$help_image_path = "extensions/rows_per_page/images/common/";
	if ($help_image_path) {} // Remove unused variable warning.

	if (!function_exists('loginLogo')) {
		function loginLogo($smarty, $defaults) {
			global $defaults;
			// Not a post action so set up company logo and name to display on login screen.
			//<img src="extensions/user_security/images/{$defaults.company_logo}" alt="User Logo">
			$image = "extensions/rows_per_page/images/" . $defaults['company_logo'];
			if (is_readable($image)) {
				$imgWidth = 0;
				$imgHeight = 0;
				$maxWidth = 100;
				$maxHeight = 100;
				$type = "";
				$attr = "";
				list($width, $height, $type, $attr) = getimagesize($image);
				if ($type || $attr) {} // eliminates unused warning.
	
				if (($width > $maxWidth || $height > $maxHeight)) {
					$wp = $maxWidth / $width;
					$hp = $maxHeight / $height;
					$percent = ($wp > $hp ? $hp : $wp);
					$imgWidth = ($width * $percent);
					$imgHeight = ($height * $percent);
				}
				if ($imgWidth > 0 && $imgWidth > $imgHeight) {
					$w1 = "20%";
					$w2 = "78%";
				} else {
					$w1 = "18%";
					$w2 = "80%";
				}
				$comp_logo_lines = "<div style='display:inline-block;width:$w1;'>" .
								   "  <img src='$image' alt='Company Logo' " .
									  ($imgHeight == 0 ? "" : "height='$imgHeight' ") .
									  ($imgWidth  == 0 ? "" : "width='$imgWidth' ") . "/>" .
								   "</div>";
				$smarty->assign('comp_logo_lines', $comp_logo_lines);
				$txt_align = "left";
			} else {
				$w2 = "100%";
				$txt_align = "center";
			}
			$comp_name_lines = "<div style='display:inline-block;width:$w2;vertical-align:middle;'>" .
							   "  <h1 style='margin-left:20px;text-align:$txt_align;'>" .
									  $defaults['company_name_item'] . "</h1>" .
							   "</div>";
	
			$smarty->assign('comp_name_lines', $comp_name_lines);
		}
	//error_log(' loginLogo()');
	}
}
//error_log(')');
*/
