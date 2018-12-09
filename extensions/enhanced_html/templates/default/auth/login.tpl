{strip}
	{foreach from=$ext_names item=ext}
		{assign var=header value="./extensions/$ext/templates/default/header.tpl"}
		{if file_exists($header)}{include file="../../../../../$header"}
			{*<!-- applying {$ext} -->
	<link rel="stylesheet" type="text/css" href="{$header}?now={$smarty.now|date_format:"%Y%M%d%H%m%s"}" media="all"/>*}
		{/if}
	{foreachelse}
		{include file="../../../../../templates/default/header.tpl"}
	{/foreach}
{/strip}
<!-- END {$header} -->
<div class="si_wrap">
  <form action="" method="post" id="frmLogin" name="frmLogin">
	<input type="hidden" name="action" value="login" />
	<div class="si_box">
		<div style="float:left;margin:0 auto;width:100%;border:none;">
		  <div style='display:inline-block;width:20%;'><img src='templates/invoices/logos/png_200!.png' alt='Company Logo' height='61' width='100' /></div>
		  <div style='display:inline-block;width:78%;vertical-align:middle;'><h1 style='margin-left:20px;text-align:left;'>{$LANG.company_name_item}</h1></div>
		</div>
	  <div class="si_box_auth_pad">
		<table>
		  <tr>
			  <th>{if isset($LANG.ID)}{$LANG.ID}{else}{$LANG.email}{/if}</th>
			<td><input name="user" size="25" type="text" title="user" value="" /></td>
		  </tr>
		  <tr>
			<th>{if isset($LANG.password)}{$LANG.password}{else}Password{/if}</th>
			<td><input name="pass" size="25" type="password" title="password" value="" /></td>
		  </tr>
		  <tr>
			<th></th>
{if $errorMessage}
			<td class='td_error'>
				<p align="center"><strong><font color="#990000">{$errorMessage|outhtml}</font></strong><br /><br /></p>
			</td>
{/if}
		  </tr>
		</table>
		<div class="si_toolbar">
		  <button type="submit" value="login">Login</button>
		</div>
	  </div>
	</div>
  </form>
</div>

<script>
  $(document).ready(function(){
	$('.si_box').hide();
	$('.si_box').slideDown(500);
  });
  document.frmLogin.user.focus();
</script>
<!-- END login tpl -->
{strip}
	{foreach from=$ext_names item=ext}
		{assign var=footer value="./extensions/$ext/templates/default/footer.tpl"}
		{if file_exists($footer)}{include file="../../../../../$footer"}
		{/if}
	{foreachelse}
		{include file="../../../../../templates/default/footer.tpl"}
	{/foreach}
{/strip}
<!-- END {$footer} -->
