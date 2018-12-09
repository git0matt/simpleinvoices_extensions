{*
 * Script: manage.tpl
 * Manage invoices template
 *
 * Last edited:
 * 2018-12-07
 * by:
 * Yuma Technical Inc.
 *}
<!-- Records-per-page invoices tpl -->
	<div class="si_toolbar si_toolbar_top">
		<a href="index.php?module=invoices&amp;view=itemised">
			<img src="images/common/add.png" alt="add" />
			{$LANG.new_invoice}
		</a>
{if $number_of_invoices == 0}
	</div>
	<div class="si_message">{$LANG.no_invoices}</div>
{else}
	</div>
	<div class="si_filters_invoices si_buttons_manage_invoices">
		<span class='si_filters_title'>{$LANG.filters}:</span>
		<span class='si_filters_links'>
			<a href="index.php?module=invoices&amp;view=manage"
			   class="first{if $smarty.get.having==''} selected{/if}">
			  {$LANG.all}
			</a>
			<a href="index.php?module=invoices&amp;view=manage&amp;having=money_owed"
			   class="{if $smarty.get.having=='money_owed'}selected{/if}">
			  {$LANG.due}
			</a>
			<a href="index.php?module=invoices&amp;view=manage&amp;having=paid"
			   class="{if $smarty.get.having=='paid'}selected{/if}">
			  {$LANG.paid}
			</a>
			<a href="index.php?module=invoices&amp;view=manage&amp;having=draft"
			   class="{if $smarty.get.having=='draft'}selected{/if}">
			  {$LANG.draft}
			</a>
			<a href="index.php?module=invoices&amp;view=manage&amp;having=real"
			   class="{if $smarty.get.having=='real'}selected{/if}">
			  {$LANG.real}
			</a>
		</span>
	</div>
	<div class="si_toolbar si_toolbar_top si_toolbar_top_left">
		<div class="si_filters_{$module}">{*  si_buttons_manage_{$module} *}
			<span class='si_filters_title'>{$LANG.customers} {$LANG.filters}:</span>
			<span class='si_filters_linksNO' id="navButtons"></span>
		</div>
	</div>
	<table id="manageGrid" style="display: none"></table>
	{include file='./xml_js.tpl' LANG=$LANG}

<script>{literal}
	function drawHead(params, name)
	{
		$('#navButtons').append('<a href="javascript:void(false)" id="all" class="'+ name+ ' first{/literal}{if isset($smarty.post.query) && $smarty.post.query==''} selected{/if}">{$LANG.all}{literal}<\/a>');
		for(var i=0; i<params.length; i++)
		{
			var str = '<a href="javascript:void(false)" class="'+ name+ '">'+ params[i]+ '<\/a>';
			$('#navButtons').append(str);
		}
	}
	$(document).ready(function(){
		if ($(window).width() < 900)
		{
			var str = ["123", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"];
			drawHead(str, "pick1st");
		} else
		{
			var str = ["1", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
			drawHead(str, "qury");
		}
		$('.pick1st').livequery('click', function(e){
			$('#navButtons').empty();
			$('#navButtons').append('<span class="qury" data-value="..">&#8635;<\/span>');
			drawHead(this.text, "qury");
		});
		var lst = '';
		$('.qury').livequery('click', function(e){
			if (lst)
				$(lst).removeClass('selected');
			else
				$('#all').removeClass('selected');
			lst = this;
			$(this).addClass('selected');
			$('#gmail_loading').show();
			if ($(window).width() < 900 && this.attribute('data-value')=="..")
			{
				$('#navButtons').empty();
				var str = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"];
				drawHead(str, 'pick1st');
			} else
			{
				var q = (this.id=='all') ? '' : this.text;/* + '%';*/
				$('#manageGrid').flexOptions({sortname: "name", sortorder: "desc", query: q, qtype: "c.name", first: true, newp: 1}).flexReload();
			}
		});
	});
</script>{/literal}

	<div id="export_dialog" class="flora" title="Export">
		<div class="si_toolbar si_toolbar_dialog">
			<a title='{$LANG.export_tooltip} {$LANG.export_pdf_tooltip}'
			   class='export_pdf export_window'><img src="images/common/page_white_acrobat.png" alt="export_pdf"/>
				{$LANG.export_pdf}
			</a>
			<a title='{$LANG.export_tooltip} {$LANG.export_xls_tooltip} .{$config->export->spreadsheet}'
			   class='export_xls export_window'><img src="images/common/page_white_excel.png" alt="export_xls"/>
				{$LANG.export_xls}
			</a>
			<a title='{$LANG.export_tooltip} {$LANG.export_doc_tooltip} .{$config->export->wordprocessor}'
			   class='export_doc export_window'><img src="images/common/page_white_word.png" alt="export_doc"/>
				{$LANG.export_doc}
			</a>
		</div>
	</div>
{/if}
