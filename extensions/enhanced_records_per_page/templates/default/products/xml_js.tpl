{* modules/products/manage.js.php *}
<script>
{literal}

var view_tooltip ="{/literal}{$LANG.quick_view_tooltip} {ldelim}1{rdelim}{literal}";
var edit_tooltip = "{/literal}{$LANG.edit_view_tooltip} {$invoices.preference.pref_inv_wording} {ldelim}1{rdelim}{literal}";
var inventory = "{/literal}{$defaults.inventory}{literal}";


var columns = 6;
var padding = 12;
var grid_width = $('.col').width() - (columns * padding);
var percentage_width = grid_width / 100;

// If Inventory in Simple Invoices is enabled than show quantity etc..
if (inventory == '1') {
    // @formatter:off
    col_model = [
        {display: '{/literal}{$LANG.actions}{literal}'   , name : 'actions'    , width : 07 * percentage_width, sortable : false, align: 'center'},
        {display: '{/literal}{$LANG.id}{literal}'        , name : 'id'         , width : 05 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.name}{literal}'      , name : 'description', width : 60 * percentage_width, sortable : true , align: 'left'  },
        {display: '{/literal}{$LANG.unit_price}{literal}', name : 'unit_price' , width : 10 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.quantity}{literal}'  , name : 'quantity'   , width : 10 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.enabled}{literal}'   , name : 'enabled'    , width : 08 * percentage_width, sortable : true , align: 'center'}
    ];
    // @formatter:on
} else {
    // @formatter:off
    col_model = [
        {display: '{/literal}{$LANG.actions}{literal}'   , name : 'actions'    , width : 07 * percentage_width, sortable : false, align: 'center'},
        {display: '{/literal}{$LANG.id}{literal}'        , name : 'id'         , width : 05 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.name}{literal}'      , name : 'description', width : 65 * percentage_width, sortable : true , align: 'left'  },
        {display: '{/literal}{$LANG.unit_price}{literal}', name : 'unit_price' , width : 15 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.enabled}{literal}'   , name : 'enabled'    , width : 08 * percentage_width, sortable : true , align: 'center'}
    ];
    // @formatter:on
}

$("#manageGrid").flexigrid
(
    {
        url: 'index.php?module=products&view=xml',
        dataType: 'xml',
        colModel : col_model,
        searchitems : [
            {display: '{/literal}{$LANG.id}{literal}'        , name : 'id'},
            {display: '{/literal}{$LANG.name}{literal}'      , name : 'description', isdefault: true},
            {display: '{/literal}{$LANG.unit_price}{literal}', name : 'unit_price'}
            ],
        sortname: 'description',
        sortorder: 'asc',
        usepager: true,
        pagestat: '{/literal}{$LANG.displaying_items}{literal}',
        procmsg: '{/literal}{$LANG.processing}{literal}',
        nomsg: '{/literal}{$LANG.no_items}{literal}',
        pagemsg: '{/literal}{$LANG.page}{literal}',
        ofmsg: '{/literal}{$LANG.of}{literal}',
//        useRp: <?php echo (getDefaultGeneric('show_rp')) ? 'true' : 'false'; ?>,//{*/literal}{if isset($show_rp) && $show_rp}true{else}false{/if}{literal*},
//        useRp: <?php echo (getDefaultGeneric('show_rp')); ?>,//{*/literal}{if isset($show_rp) && $show_rp}true{else}false{/if}{literal*},
 		useRp: {/literal}{if isset($defaults.show_rp)}true{elseif isset($defaults.default_rp_products) && $defaults.default_rp_products > 0}true{else}false{/if}{literal},
 		rp: {/literal}{if isset($smarty.get.rp)}{$smarty.get.rp}{elseif isset($defaults.default_rp) && $defaults.show_rp == $LANG.enabled}{$defaults.default_rp}{elseif isset($defaults.default_rp_products) && $defaults.default_rp_products > 0}{$defaults.default_rp_products}{else}20{/if}{literal},
        showToggleBtn: false,
        showTableToggleBtn: false,
        height: 'auto'
    }
);
{/literal}
</script>
