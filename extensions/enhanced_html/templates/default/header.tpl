{assign var=using value="enhanced_html"}
{include file="./headline.xml"}

<!DOCTYPE html>
{strip}
{if isset($smarty.cookies.lang) && $smarty.cookies.lang!=null && $smarty.cookies.lang!=''}
	{assign var=html_lang value=$smarty.cookies.lang|substr:0:2}
{else}
	{assign var=html_lang value=$defaults.language|substr:0:2}
{/if}
{/strip}
<html lang="{$html_lang|default:en_CA}">
<head>
{*DEBUG*}
{strip}
	{assign var='tmp_lang_module' value="title_module_`$module`"}
	{assign var='tmp_lang_module' value=$LANG.$tmp_lang_module|default:$LANG.$module|default:$module}
	{assign var='tmp_lang_view' value="title_view_`$view`"}
	{assign var='tmp_lang_view' value=$LANG.$tmp_lang_view|default:$LANG.$view|default:$view}
	{$smarty.capture.hook_head_start}
{/strip}
	<title>{$tmp_lang_module|default:$LANG.invoice} : {$tmp_lang_view|default:$LANG.view} - {if isset($defaults.company_name_item)}{$defaults.company_name_item}{else}{$defaults.company_name|default:$LANG.company_name}{/if} </title>
	<meta charset="UTF-8" />
	<meta name="robots" content="noindex, nofollow" />
	<link rel="shortcut icon" href="images/common/favicon.ico" />
{literal}
	<link rel="stylesheet" type="text/css" href="include/jquery/wysiwyg/wysiwyg.css" />
	<link rel="stylesheet" type="text/css" href="include/jquery/jquery.plugins.css" title="default" media="screen" />
	<link rel="stylesheet" type="text/css" href="include/jquery/rte/rte.css" />    
	<link rel="stylesheet" type="text/css" href="include/jquery/cluetip/jquery.cluetip.css" />
{/literal}
{strip}
	<link rel="stylesheet" type="text/css" href="templates/default/css/main.css?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}" media="all"/>
	<link rel="stylesheet" type="text/css" href="templates/default/css/print.css?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}" media="print" />
{/strip}
{strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/css/style.css"}
		{if file_exists($dir)}
			{*<!-- applying {$ext} -->*}
	<link rel="stylesheet" type="text/css" href="{$dir}?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}" media="all"/>
		{/if}
	{/foreach}
{/strip}
{* eliminated type="text/javascript" *}

{literal}
	<script src="include/jquery/jquery-1.2.6.min.js"></script>
	<script src="include/jquery/jquery.init.js"></script>
{/literal}
{*	moved to footer<!-- jQuery Files -->
	<script src="include/jquery/jquery-ui-personalized-1.6rc2.packed.js"></script>    
	<script src="include/jquery/cluetip/jquery.hoverIntent.minified.js"></script>
	<script src="include/jquery/cluetip/jquery.cluetip.js"></script>
	<script src="include/jquery/jquery.plugins.js"></script>
	<script src="include/jquery/wysiwyg/wysiwyg.modified.packed.js"></script>
	<script src="include/jquery/jquery.livequery.pack.js"></script>	*}
	<script src="include/jquery/jquery.flexigrid.1.0b3.pack.js"></script>
	<script src="include/jquery/jquery.functions.js"></script>
	<script src="include/jquery/jquery.conf.js"></script>	
	{$extension_jquery_files}
	{if $config->debug->level == "All"}
	<link rel="stylesheet" type="text/css" href="library/blackbirdjs/blackbird.css" />    
	<script src="library/blackbirdjs/blackbird.js"></script>
	{/if}
{literal}
	<script src="include/jquery/jquery.validationEngine.js"></script>
{/literal}
{/strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/js/header.js"}
		{if file_exists($dir)}
			{*<!-- applying {$ext} -->*}
{*literal*}
	<script src="{$dir}?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}"></script>
{*/literal*}
		{/if}
	{/foreach}
{/strip}
{strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/js/inhead.js"}
		{if file_exists($dir)}
			{*<!-- applying script {$ext} -->*}
	<script>
{literal}
	{include file="../../../../$dir"}
{/literal}
</script>
		{/if}
	{/foreach}
{/strip}
{strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/js/inline.js"}
		{if file_exists($dir)}
			{*<!-- applying contents of {$ext} -->*}
	<script>
{literal}
	{include file="../../../../$dir"}
{/literal}
</script>
		{/if}
	{/foreach}
{/strip}
{$smarty.capture.hook_head_end}
</head>
<body class="body_si body_module_{$module} body_view_{$view}">
{strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/body.tpl"}
		{if file_exists($dir)}
{/strip}
	{include file="../../../../$dir"}
{strip}
		{/if}
	{/foreach}
{/strip}
	{$smarty.capture.hook_body_start}
	<div class="si_grey_background"></div>
