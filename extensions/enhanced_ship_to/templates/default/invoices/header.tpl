{*
 * Script: header.tpl
 *    Header file for invoice template
 *
 * License:
 *   GPL v3 or above
 *
 * Website:
 *  https://simpleinvoices.group *}
<!-- extensions/enhanced_ship_to/templates/default/invoices/header.tpl -->
<input type="hidden" name="action" value="insert"/>
<div class="si_filters si_buttons_invoice_header">
    <span class="si_filters_links">
      <a href="index.php?module=invoices&amp;view=itemised{if $template}&amp;template={$template}{/if}{if $defaultCustomerID}&amp;customer_id={$defaultCustomerID}{/if}"
         class="first{if $view=='itemised'} selected{/if}">
        <img class="action" src="images/common/edit.png"/>
          {$LANG.itemised_style}
      </a>
      <a href="index.php?module=invoices&amp;view=total{if $template}&amp;template={$template}{/if}{if $defaultCustomerID}&amp;customer_id={$defaultCustomerID}{/if}" class="{if $view=='total'}selected{/if}">
        <img class="action" src="images/common/page_white_edit.png"/>
          {$LANG.total_style}
      </a>
    </span>
    <span class="si_filters_title">
      <a class="cluetip" href="#" title="{$LANG.invoice_type}"
         rel="index.php?module=documentation&amp;view=view&amp;page=help_invoice_types">
        <img class="" src="{$help_image_path}help-small.png" alt=""/>
      </a>
    </span>
</div>
<table class='si_invoice_top'>
    {if $template}
    <tr>
        <th>{$LANG.copied_from}</th>
        <td>{$template|htmlsafe}</td>
    </tr>
    {/if}
    <tr>
        <th>{$LANG.biller}</th>
        <td>
            {if $billers == null }
                <p><em>{$LANG.no_billers}</em></p>
            {else}
                <select name="biller_id">
                    {foreach from=$billers item=biller}
                        <option {if $biller.id == $defaults.biller} selected {/if} value="{$biller.id|htmlsafe}">
                            {$biller.name|htmlsafe}
                        </option>
                    {/foreach}
                </select>
            {/if}
        </td>
    </tr>
    <tr>
        <th>{$LANG.customer}</th>
        <td>
            {if $customers == null }
                <em>{$LANG.no_customers}</em>
            {else}
                <select name="customer_id">
                    {foreach from=$customers item=customer}
                        <option {if $customer.id == $defaultCustomerID} selected {/if} value="{$customer.id|htmlsafe}">
                            {$customer.name|htmlsafe}
                        </option>
                    {/foreach}
                </select>
            {/if}
        </td>
    </tr>
    {**}
    <tr>
        <th>{$LANG.ship_to}</th>
        <td>
            {if $customers == null }
                <em>{$LANG.no_customers}</em>
            {else}
                <select name="ship_to_customer_id">
                    <option value="0"></option>
                    {foreach from=$customers item=customer}
                        <option {if $customer.id == $defaultCustomerID} selected {/if} value="{$customer.id|htmlsafe}">
                            {$customer.name|htmlsafe}
                        </option>
                    {/foreach}
                </select>
            {/if}
        </td>
    </tr>
    {**}
    <tr>
        <th>{$LANG.date_formatted}</th>
        <td>
            <input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="date" id="date1"
                   value="{if $smarty.get.date}{$smarty.get.date}{else}{$smarty.now|date_format:"%Y-%m-%d"}{/if}"/>
        </td>
    </tr>
</table>

