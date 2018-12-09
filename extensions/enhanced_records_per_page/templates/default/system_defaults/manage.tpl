{* This section will be added to the system_defaults manage screen. templates/default/system_defaults/manage.tpl *}
{*DEBUG*}
<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.invoices)}{$LANG.invoices}{else}invoices{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_invoices'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_invoices) && $defaults.default_rp_invoices>0}{$defaults.default_rp_invoices}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.payments)}{$LANG.payments}{else}payments{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_payments'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_payments) && $defaults.default_rp_payments>0}{$defaults.default_rp_payments}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.customers)}{$LANG.customers}{else}customers{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_customers'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_customers) && $defaults.default_rp_customers>0}{$defaults.default_rp_customers}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.billers)}{$LANG.billers}{else}billers{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_billers'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_billers) && $defaults.default_rp_billers>0}{$defaults.default_rp_billers}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.users)}{$LANG.users}{else}users{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_users'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_users) && $defaults.default_rp_users>0}{$defaults.default_rp_users}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.products)}{$LANG.products}{else}products{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_products'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_products) && $defaults.default_rp_products>0}{$defaults.default_rp_products}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{else}Default Records per Page{/if} ({if isset($LANG.extensions)}{$LANG.extensions}{else}extensions{/if})
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp_extensions'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp_extensions) && $defaults.default_rp_extensions>0}{$defaults.default_rp_extensions}{else}{$LANG.disabled}{/if}</td>
</tr>

{*
<tr>
  <th>{$LANG.show_rp}
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=show_rp"
         title="{$LANG.show_rp}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=show_rp'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.show_rp) && $defaults.show_rp}{$LANG.enabled}{else}{$LANG.disabled}{/if}</td>
</tr>

<tr>
  <th>{if isset($LANG.default_rp)}{$LANG.default_rp}{/if}
<!--    <a class="cluetip" href="#"
         rel="index.php?module=documentation&amp;view=view&amp;page=default_rp"
         title="{if isset($LANG.default_rp)}{$LANG.default_rp}{/if}">
      <img src="{$help_image_path}help-small.png" alt="help-small" />
    </a>-->
  </th>
  <td>
    <a href='index.php?module=system_defaults&amp;view=edit&amp;submit=default_rp'>
      <img src="images/common/edit.png" title="{$LANG.edit}" alt="{$LANG.edit}" />
    </a>
  </td>
  <td>{if isset($defaults.default_rp) && $defaults.default_rp}{$defaults.default_rp}{/if}</td>
</tr>
*}