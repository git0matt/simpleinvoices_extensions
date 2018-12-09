	</div>

{if !isset($version)}{assign var=version value="."|explode:$config->version->name}{/if}
	<div id="si_footer">
		<div class="si_wrap">
			{$LANG.thank_you_inv}<a href="http://www.simpleinvoices.org">{$LANG.simple_invoices}</a> | 
			<a href="http://www.simpleinvoices.org/+">{$LANG.forum}</a> | 
			<a href="http://www.simpleinvoices.org/blog">{$LANG.blog}</a> |
			<span class="version">{*<!--version is-->*} {$version|implode:"."|htmlsafe}</span>
		</div>
	</div>

{$smarty.capture.hook_body_end}
	<script src="include/jquery/jquery-ui-personalized-1.6rc2.packed.js"></script>    
	<script src="include/jquery/cluetip/jquery.hoverIntent.minified.js"></script>
	<script src="include/jquery/cluetip/jquery.cluetip.js"></script>
{*	in head section
	<script src="include/jquery/jquery.flexigrid.1.0b3.pack.js"></script>	*}
	<script src="include/jquery/jquery.plugins.js"></script>
	<script src="include/jquery/wysiwyg/wysiwyg.modified.packed.js"></script>
	<script src="include/jquery/jquery.livequery.pack.js"></script>
{*	in head section
	<script src="include/jquery/jquery.functions.js"></script>
	<script src="include/jquery/jquery.conf.js"></script>	*}
{/strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/js/script.js"}
		{if file_exists($dir)}
			{*<!-- applying script {$ext} -->*}
{*literal*}
	<script src="{$dir}?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}"></script>
{*/literal*}
		{/if}
	{/foreach}
{/strip}
{/strip}
	{foreach from=$ext_names item=ext}
		{assign var=dir value="./extensions/$ext/templates/default/js/footer.js"}
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
		{assign var=dir value="./extensions/$ext/templates/default/js/infoot.js"}
		{if file_exists($dir)}
			{*<!-- applying contents of {$ext} -->*}
	<script>
{literal}
	{include file="{$dir}"}
{/literal}
</script>
		{/if}
	{/foreach}
{/strip}
</body>
</html>
