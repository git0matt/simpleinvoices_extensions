<?php
/**********
Script: ./extensions/enhanced_ship_to/include/class/ShipTo.php
simple_invoices extension class

Last edited:
2018-12-09	git0matt@gmail.com
**********/

if (class_exists('Extension')) {
	class ShipTo extends Extension
	{
		
		function __construct()
		{
			$this->name = 				"ShipTo";
			$this->directoryName = 		'enhanced_ship_to';
			$this->version = 			'1.0.0';
			$this->author = 			'git0matt@gmail.com';
			$this->requires = 			array('MAJOR' => "2017", 'MINOR' => "2", 'SUB' => "0");
			$this->displayName = 		'Ship To';
			$this->description = 		'Adds a ship to field to invoices.';
			$this->confirmDisable = 	'Are you sure you want to disable the extension? All associated data will be lost.';
			/*$this->dependsOn = 			array('enhaced_html');*/
			//parent::__construct();
			error_log('ShipTo: made instance');
		}


		public static function main()
		{
			//if (!isset(self::abspath))
			//{
				$depends = $this->has_depends();
				if (!$this->requires_version() && $depends !== true)
				{
					echo 'This extension requires version '
						. $this->requires['marjor']. '. (this: '. intval($version[0]). ' - '. print_r($version, true). ').';
					echo 'Dependency check: '. print_r($depends, true);
				}
				$path = $this->abspath. '/'. $this->directoryName;
				//if (!file_exists(dirname(__FILE__). '/../../../include/BackupDbORG.php')) {	//only do if no backup file already exists
					$this->backup_copy($path. '/replace/include/class/Invoice.php', $path. '/../../include/class/Invoice.php');	//replace core class with my file
				//}
				error_log('Dependency check: '. print_r($depends, true));
			//}
		}

	}
}
else
{
	error_log('Advanced_menu: No Extension class to extend');
}
