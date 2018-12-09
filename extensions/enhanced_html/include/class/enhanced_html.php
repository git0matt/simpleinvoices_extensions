<?php
/**********
 Script: extensions/enhanced_html/include/class/enhanced_html.php
 simple_invoices extension class
 
 Last edited:
 2018-12-09	git0matt@gmail.com
 **********/
	
if (class_exists('Extension')) {
	class enhanced_html extends Extension
	{
		
		function __construct()
		{
			$this->name = 				"enhanced_html";
			$this->directoryName = 		'enhanced_html';
			$this->version = 			'1.0.0';
			$this->author = 			'git0matt@gmail.com';
			$this->requires = 			array('MAJOR' => "2017", 'MINOR' => "2", 'SUB' => "0");
			$this->displayName = 		'Advanced menu';
			$this->description = 		'Allows users to easily add CSS and JS files.';
			$this->confirmDisable = 	'Are you sure you want to disable the extension? All associated data will be lost.';
			//$this->dependsOn = 			array('Cssinhead');
			//parent::__construct();
			/*
			 $this->abspath = 			realpath (dirname (__FILE__));
			 error_log("AlphaNavigate: abs=". $this->abspath);
			 $this->relpath = 			substr (str_replace (dirname ($_SERVER['PHP_SELF']), "", dirname (strstr ($this->abspath, dirname ($_SERVER['PHP_SELF'])))). '/', 1);
			 error_log("AlphaNavigate: rel=". $this->relpath);*/
			error_log('enhanced_html: made instance');
		}
		
		
		function main()
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
			error_log('Dependency check: '. print_r($depends, true));
			
			//if (!file_exists($this->abspath. '/../../../../include/class/export.phpORG')) {	//only do if no backup file already exists
			//	$this->backup_copy($this->abspath. '/include/replacements/export.php', $this->abspath. '/../../../../include/class/export.php');
			//}
			//}
		}
	
	}
}
else
{
	error_log('Advanced_menu: No Extension class to extend');
}
