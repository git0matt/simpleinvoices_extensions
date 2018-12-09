<table class='si_invoice_view'>
    <!-- Invoice Summary section -->
    <tr class="tr_head">
        <th class="">{$preference.pref_inv_wording|htmlsafe}&nbsp;{$LANG.number_short}:</th>
        <td colspan="4">{$invoice.index_id|htmlsafe}</td>
        <td class="si_switch">
            <a href='#' class="show-summary" onclick="$('.summary').show();$('.show-summary').hide();">
                <img src="images/common/magnifier_zoom_in.png" title="{$LANG.show_details}"/>
            </a>
            <a href='#' class="summary" onclick="$('.summary').hide();$('.show-summary').show();">
                <img src="images/common/magnifier_zoom_out.png" title="{$LANG.hide_details}"/>
            </a>
        </td>
    </tr>
    <tr class="summary">
        <th class="">{$preference.pref_inv_wording} {$LANG.date_upper}:</th>
        <td colspan="5">{$invoice.date|htmlsafe}</td>
    </tr>
    {$customFields.1}
    {$customFields.2}
    {$customFields.3}
    {$customFields.4}
    <tr>
        <td><br/></td>
    </tr>
    <!-- Biller section -->
    <tr class="tr_head">
        <th>{$LANG.biller}:</th>
        <td colspan="4">{$biller.name|htmlsafe}</td>
        <td class="si_switch">
            <a href='#' class="show-biller" onclick="$('.biller').show();$('.show-biller').hide();">
                <img src="images/common/magnifier_zoom_in.png" title="{$LANG.show_details}"/>
            </a>
            <a href='#' class="biller" onclick="$('.biller').hide();$('.show-biller').show();">
                <img src="images/common/magnifier_zoom_out.png" title="{$LANG.hide_details}"/>
            </a>
        </td>
    </tr>
    <tr class="biller">
        <th>{$LANG.street}:</th>
        <td colspan="5">{$biller.street_address|htmlsafe}</td>
    </tr>
    <tr class="biller">
        <th>{$LANG.street2}:</th>
        <td colspan="5">{$biller.street_address2|htmlsafe}</td>
    </tr>
    <tr class="biller">
        <th>{$LANG.city}:</th>
        <td colspan="3">{$biller.city|htmlsafe}</td>
        <th>{$LANG.phone_short}:</th>
        <td>{$biller.phone|htmlsafe}</td>
    </tr>
    <tr class="biller">
        <th>{$LANG.state}, {$LANG.zip}:</th>
        <td colspan="3">{$biller.state|htmlsafe},&nbsp;{$biller.zip_code|htmlsafe}</td>
        <th>{$LANG.mobile_short}:</th>
        <td>{$biller.mobile_phone|htmlsafe}</td>
    </tr>
    <tr class="biller">
        <th>{$LANG.country}:</th>
        <td colspan="3">{$biller.country|htmlsafe}</td>
        <th>{$LANG.fax}:</th>
        <td>{$biller.fax|htmlsafe}</td>
    </tr>
    <tr class="biller">
        <th>{$LANG.email}:</th>
        <td colspan="5">{$biller.email|htmlsafe}</td>
    </tr>
    {if !empty($customFieldLabels.biller_cf1)}
        <tr class="biller">
            <th>{$customFieldLabels.biller_cf1|htmlsafe}:</th>
            <td colspan="5">{$biller.custom_field1|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.biller_cf2)}
        <tr class="biller">
            <th>{$customFieldLabels.biller_cf2|htmlsafe}:</th>
            <td colspan="5">{$biller.custom_field2|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.biller_cf3)}
        <tr class="biller">
            <th>{$customFieldLabels.biller_cf3|htmlsafe}:</th>
            <td colspan="5">{$biller.custom_field3|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.biller_cf4)}
        <tr class="biller">
            <th>{$customFieldLabels.biller_cf4|htmlsafe}:</th>
            <td colspan="5">{$biller.custom_field4|htmlsafe}</td>
        </tr>
    {/if}
    {* {showCustomFields categorieId="1" itemId=$biller.id } *}
    <tr>
        <td colspan="6"><br/></td>
    </tr>
    <!-- Customer section -->
    <tr class="tr_head">
        <th>{$LANG.customer}:</th>
        <td colspan="4">{$customer.name|htmlsafe}</td>
        <td class="si_switch">
            <a href='#' class="show-customer"
               {literal}onclick="$('.customer').show(); $('.show-customer').hide(); {/literal}">
                <img src="images/common/magnifier_zoom_in.png" title="{$LANG.show_details}"/>
            </a>
            <a href='#' class="customer"
               {literal}onclick="$('.customer').hide(); $('.show-customer').show(); {/literal}">
                <img src="images/common/magnifier_zoom_out.png" title="{$LANG.hide_details}"/>
            </a>
        </td>
    </tr>
    <tr class="customer">
        <th>{$LANG.attention_short}:</th>
        <td colspan="5" align="left">{$customer.attention|htmlsafe},</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.street}:</th>
        <td colspan="5" align="left">{$customer.street_address|htmlsafe}</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.street2}:</th>
        <td colspan="5" align="left">{$customer.street_address2|htmlsafe}</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.city}:</th>
        <td colspan="3">{$customer.city|htmlsafe}</td>
        <th>{$LANG.phone_short}:</th>
        <td>{$customer.phone|htmlsafe}</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.state}, {$LANG.zip}:</th>
        <td colspan="3">{$customer.state|htmlsafe},&nbsp;{$customer.zip_code|htmlsafe}</td>
        <th>{$LANG.mobile_short}:</th>
        <td>{$customer.mobile_phone|htmlsafe}</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.country}:</th>
        <td colspan="3">{$customer.country|htmlsafe}</td>
        <th>{$LANG.fax}:</th>
        <td>{$customer.fax|htmlsafe}</td>
    </tr>
    <tr class="customer">
        <th>{$LANG.email}:</th>
        <td colspan="5">{$customer.email|htmlsafe}</td>
    </tr>
    {if !empty($customFieldLabels.customer_cf1)}
        <tr class="customer">
            <th>{$customFieldLabels.customer_cf1}:</th>
            <td colspan="5">{$customer.custom_field1|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.customer_cf2)}
        <tr class="customer">
            <th>{$customFieldLabels.customer_cf2}:</th>
            <td colspan="5">{$customer.custom_field2|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.customer_cf3)}
        <tr class="customer">
            <th>{$customFieldLabels.customer_cf3}:</th>
            <td colspan="5">{$customer.custom_field3|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.customer_cf4)}
        <tr class="customer">
            <th>{$customFieldLabels.customer_cf4}:</th>
            <td colspan="5">{$customer.custom_field4|htmlsafe}</td>
        </tr>
    {/if}
    <tr class="customer">
        <th>{$LANG.default_invoice}</th>
        <td colspan="4">{$customer.default_invoice}</td>
        <td class='details_screen align_right'>
            <a href="?module=invoices&view=usedefault&action=update_template&id={$invoice.id}&customer_id={$customer.id}">
                <img src="images/flexigrid/load.png" title='{$LANG.invoice} {$invoice.index_id} {$LANG.as_template} {$LANG.for} {$customer.name}'/>
            </a>
        </td>
    </tr>
    <!-- ship_to section -->
    <tr class="tr_head">
        <th>{$LANG.ship_to}:</th>
        <td colspan="4">{$ship_to_customer.name|htmlsafe}</td>
        <td class="si_switch">
            <a href='#' class="show-ship_to"
               {literal}onclick="$('.ship_to').show(); $('.show-ship_to').hide(); {/literal}">
                <img src="images/common/magnifier_zoom_in.png" title="{$LANG.show_details}"/>
            </a>
            <a href='#' class="ship_to"
               {literal}onclick="$('.ship_to').hide(); $('.show-ship_to').show(); {/literal}">
                <img src="images/common/magnifier_zoom_out.png" title="{$LANG.hide_details}"/>
            </a>
        </td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.attention_short}:</th>
        <td colspan="5" align="left">{$ship_to_customer.attention|htmlsafe},</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.street}:</th>
        <td colspan="5" align="left">{$ship_to_customer.street_address|htmlsafe}</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.street2}:</th>
        <td colspan="5" align="left">{$ship_to_customer.street_address2|htmlsafe}</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.city}:</th>
        <td colspan="3">{$ship_to_customer.city|htmlsafe}</td>
        <th>{$LANG.phone_short}:</th>
        <td>{$ship_to_customer.phone|htmlsafe}</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.state}, {$LANG.zip}:</th>
        <td colspan="3">{$ship_to_customer.state|htmlsafe},&nbsp;{$ship_to_customer.zip_code|htmlsafe}</td>
        <th>{$LANG.mobile_short}:</th>
        <td>{$ship_to_customer.mobile_phone|htmlsafe}</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.country}:</th>
        <td colspan="3">{$ship_to_customer.country|htmlsafe}</td>
        <th>{$LANG.fax}:</th>
        <td>{$ship_to_customer.fax|htmlsafe}</td>
    </tr>
    <tr class="ship_to">
        <th>{$LANG.email}:</th>
        <td colspan="5">{$ship_to_customer.email|htmlsafe}</td>
    </tr>
    {if !empty($customFieldLabels.ship_to_cf1)}
        <tr class="ship_to">
            <th>{$customFieldLabels.ship_to_cf1}:</th>
            <td colspan="5">{$ship_to_customer.custom_field1|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.ship_to_cf2)}
        <tr class="ship_to">
            <th>{$customFieldLabels.ship_to_cf2}:</th>
            <td colspan="5">{$ship_to_customer.custom_field2|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.ship_to_cf3)}
        <tr class="ship_to">
            <th>{$customFieldLabels.ship_to_cf3}:</th>
            <td colspan="5">{$ship_to_customer.custom_field3|htmlsafe}</td>
        </tr>
    {/if}
    {if !empty($customFieldLabels.ship_to_cf4)}
        <tr class="ship_to">
            <th>{$customFieldLabels.ship_to_cf4}:</th>
            <td colspan="5">{$ship_to_customer.custom_field4|htmlsafe}</td>
        </tr>
    {/if}
    <tr class="ship_to">
        <th>{$LANG.default_invoice}</th>
        <td colspan="4">{$ship_to_customer.default_invoice}</td>
        <td class='details_screen align_right'>
            <a href="?module=invoices&view=usedefault&action=update_template&id={$invoice.id}&customer_id={$customer.id}">
                <img src="images/flexigrid/load.png" title='{$LANG.invoice} {$invoice.index_id} {$LANG.as_template} {$LANG.for} {$customer.name}'/>
            </a>
        </td>
    </tr>
</table>
    <script type="text/javascript">{literal}
        $('.show-ship_to').show();
        $('.ship_to').hide();
    </script>{/literal}
