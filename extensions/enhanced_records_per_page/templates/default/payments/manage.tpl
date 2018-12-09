{*
/*
* Script: manage.tpl
* 	 Payments manage template
*
* Last edited:
* 	 2008-09-01
*/
*}
<!-- Records-per-page payments tpl -->
	<div class="si_toolbar si_toolbar_top">
		<a href="index.php?module=payments&amp;view=process&amp;op=pay_invoice" class=""><img src="images/famfam/add.png" alt="add"/>{$LANG.process_payment}</a>
 
	{if $smarty.get.id }
        <a href="index.php?module=payments&amp;view=process&amp;id={$smarty.get.id|urlencode}&amp;op=pay_selected_invoice" class=""><img src="images/famfam/money.png" alt="pay"/>{$LANG.payments_filtered_invoice}</a>
	</div>
        
        {if $payments == null}
			<div class="si_message">
        		{$LANG.no_payments_invoice}
			</div>        		
        {else}
        	<table id="manageGrid" style="display:none"></table>
        	{*include file='../../../modules/payments/manage.js.php' get=$smarty.get*}
            {include file='./xml_js.tpl' get=$smarty.get}
        {/if}

	{elseif $smarty.get.c_id }
	</div>

        {if $payments == null}
			<div class="si_message">
				{$LANG.no_payments_customer}
			</div>        		
        {else}
    	    <table id="manageGrid" style="display:none"></table>
        	{*include file='../../../modules/payments/manage.js.php' get=$smarty.get*}
            {include file='./xml_js.tpl' get=$smarty.get}
        {/if}

	{else}
	</div>

        {if $payments == null}
			<div class="si_message">
        		{$LANG.no_payments}
			</div>        		
        {else}
        	<table id="manageGrid" style="display:none"></table>
        	{*include file='../../../modules/payments/manage.js.php' get=$smarty.get*}
            {include file='./xml_js.tpl' get=$smarty.get}
        {/if}

	{/if}

<div class="si_help_div">
	<a class="cluetip" href="#"	rel="index.php?module=documentation&amp;view=view&amp;page=help_wheres_the_edit_button" title="{$LANG.wheres_the_edit_button}"><img src="{$help_image_path}help-small.png" alt="help-small" /> Wheres the Edit button?</a>
</div>
{* sortname: "ac_inv_id", sortorder: "desc", query: "a", qtype: "c.name" *}
