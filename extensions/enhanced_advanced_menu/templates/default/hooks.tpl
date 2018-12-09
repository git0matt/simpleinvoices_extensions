{capture name=hook_tabmenu_end}
	<div id="advanced">
		<ul class="subnav">
			<li><a href="index.php?module=extensions&amp;view=manage">{if isset($LANG.extensions)}{$LANG.extensions}{else}extensions{/if}</a></li>
		</ul>
	</div>
	<!-- hook_tabmenu_end -->
{/capture}
{strip}

{/strip}
{capture name=hook_tabmenu_main_end}
		<li style="float:right" class="menu_setting"><a href="#advanced"><span>{if isset($LANG.advanced)}{$LANG.advanced}{else}ADVanced{/if}</span></a></li>
		{*<!-- hook_tabmenu_main_end -->*}
{/capture}
