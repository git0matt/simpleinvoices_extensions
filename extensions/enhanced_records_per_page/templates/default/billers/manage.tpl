{*
 * Script: manage.tpl
 *  Biller manage template
 *
 *
 * License:
 *   GPL v3 or above
 *}
 <!-- Records_per_page billers tpl -->
	<div class="si_toolbar si_toolbar_top">
		<a href="index.php?module=billers&amp;view=add" class="">
			<img src="images/famfam/add.png" alt="" /> {$LANG.add_new_biller}
		</a>
{if $number_of_rows.count == 0}
	</div>
	<div class="si_message">{$LANG.no_billers}</div>
{else}
		<div class="si_filters_{$module} si_buttons_manage_{$module}">
			<span class='si_filters_title'>{$LANG.filters}:</span>
			<span class='si_filters_linksNO' id="navButtons"></span>
		</div>
	</div>
	<br />
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
				var q = (this.id=='all') ? '' : this.text + '%';
				$('#manageGrid').flexOptions({sortname: "name", sortorder: "asc", query: q, qtype: "name", first: true, newp: 1}).flexReload();
			}
		});
	});
</script>{/literal}

{/if}
