{* modules/billers/manage.js.php *}
<script type="text/javascript">
{literal}
/*
		'<!--0 Quick View --><a class="index_table" href="index.php?module=biller&view=details&id={1}&action=view"> <img src="images/common/view.png" height="16" border="-5px" padding="-4px" valign="bottom" /></a>',
		'<!--1 Edit View --><a class="index_table" href="index.php?module=biller&view=details&id={1}&action=edit"><img src="images/common/edit.png" height="16" border="-5px" padding="-4px" valign="bottom" /><!-- print --></a>',
*/	
	var columns = 6;
	var padding = 12;
	var grid_width = $('.col').width();

	grid_width = grid_width - (columns * padding);
	percentage_width = grid_width / 100;

	$('#manageGrid').flexigrid({
		url: 'index.php?module=billers&view=xml',/*"{/literal}{$url}{literal}",*//*'index.php?module=billers&view=xml2',*/
		dataType: 'xml',
		colModel : [
			{display: '{/literal}{$LANG.actions}{literal}', name: 'actions', width: 10 * percentage_width, sortable: false, align: 'center'},
			{display: '{/literal}{$LANG.id}{literal}', name: 'id', width: 10 * percentage_width, sortable: true, align: 'right'},
		   {display: '{/literal}{$LANG.name}{literal}', name: 'name', width: 40 * percentage_width, sortable: true, align: 'left'},
			{display: '{/literal}{$LANG.email}{literal}', name: 'email', width: 30 * percentage_width, sortable: true, align: 'left'},
			{display: '{/literal}{$LANG.enabled}{literal}', name: 'enabled', width: 10 * percentage_width, sortable: true, align: 'center'}
			],
		searchitems : [
			{display: '{/literal}{$LANG.id}{literal}', name: 'id'},
			{display: '{/literal}{$LANG.name}{literal}', name: 'name', isdefault: true},
			{display: '{/literal}{$LANG.email}{literal}', name: 'email'}
		],
		sortname: 'name',
		sortorder: 'asc',
		usepager: true,
		/*title: 'Manage Custom Fields',*/
		pagestat: '{/literal}{$LANG.displaying_items}{literal}',
		procmsg: '{/literal}{$LANG.processing}{literal}',
		nomsg: '{/literal}{$LANG.no_items}{literal}',
		pagemsg: '{/literal}{$LANG.page}{literal}',
		ofmsg: '{/literal}{$LANG.of}{literal}',
		useRp: {/literal}{if isset($defaults.show_rp)}true{elseif isset($defaults.default_rp_billers) && $defaults.default_rp_billers > 0}true{else}false{/if}{literal},
		rp: {/literal}{if isset($smarty.get.rp)}{$smarty.get.rp}{elseif isset($defaults.default_rp) && $defaults.show_rp == $LANG.enabled}{$defaults.default_rp}{elseif isset($defaults.default_rp_billers) && $defaults.default_rp_billers > 0}{$defaults.default_rp_billers}{else}20{/if}{literal},
		showToggleBtn: false,
		showTableToggleBtn: false,
		height: 'auto'
	});
{/literal}
</script>
