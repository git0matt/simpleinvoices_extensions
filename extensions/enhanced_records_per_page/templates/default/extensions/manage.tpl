{*
 * Script: manage.tpl
 *   Extensions manage template
 *
 * Last edited:
 *   2009-02-12
 *
 *}
<!-- Records-per-page extensions tpl -->
<br />
<!--<div class="si_message">
  Note: Manage extensions is still a work-in-progress
</div>-->
{if $exts == null}
	<p><em>No extensions registered</em></p>
{else}
	<table id="manageGrid" style="display:none"></table>
	{*include file='../../../modules/extensions/manage.js.php'*}
	{include file='./xml_js.tpl'}
{/if}
