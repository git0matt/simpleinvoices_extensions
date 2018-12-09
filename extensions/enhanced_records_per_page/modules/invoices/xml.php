<?php
header("Content-type: text/xml");
global $auth_session, $LANG, $pdoDb;

// @formatter:off
/**
 * Standard invoice selection for display in flexgrid by xml files.
 * <strong>NOTE:</strong> DO NOT CLEAR $pdoDb as some selection and other values might have been added
 * prior to calling this method.
 *
 * @param string $type Three setting:
 *        <ol>
 *          <li><b>count</b> - Accessed for row count based on select criteria. Excludes <i>LIMIT</i> setting</li>
 *          <li><b>&nbsp;&nbsp;</b> - All other settings are result in normal access of data based on specified criteria.</li>
 *        </ol>
 * @param string $sort Field to order results.
 * @param string $dir Direction of the order (ASC, DESC, A or D).
 * @param string $rp Number of lines to report per page.
 * @param string $page Page number processed.
 * @param string $qtype Special query field name.
 * @param string $query Value to look for. Will be enclosed in wildcards and searched using <i>LIKE</i>.
 * @return array Selected rows.
 * @throws PdoDbException
 */
function my_select_all($type="", $sort="", $dir="", $rp=null, $page="", $qtype="", $query="") {
	global $auth_session, $pdoDb;
	
	// If user role is customer or biller, then restrict invoices to those they have access to.
	if ($auth_session->role_name == 'customer') {
		$pdoDb->addSimpleWhere("c.id", $auth_session->user_id, "AND");
	} elseif ($auth_session->role_name == 'biller') {
		$pdoDb->addSimpleWhere("b.id", $auth_session->user_id, "AND");
	}
	
	$count_type = ($type == "count");
	
	if (empty($sort) ||
		!in_array($sort, array('index_id', 'b.name', 'c.name', 'date', 'invoice_total', 'owing', 'aging'))) $sort = "index_id";
	if (empty($dir)) $dir = "DESC";
	$pdoDb->setOrderBy(array($sort, $dir));
	
	// If caller pass a null value, that mean there is no limit.
	if (isset($rp) && !$count_type) {
		if (empty($rp  )) $rp    = "25";
		if (empty($page)) $page  = "1";
		$start = (($page - 1) * $rp);
		$pdoDb->setLimit($rp, $start);
	}
	
	if (!(empty($query) || empty($qtype))) {
		if (in_array($qtype, array('index_id','b.name','c.name','date','invoice_total','owing','aging'))) {
			$pdoDb->addToWhere(new WhereItem(false, $qtype, "LIKE", "%$query%", false, "AND"));
		}
	}
	$pdoDb->addSimpleWhere("iv.domain_id", domain_id::get());

	$fn = new FunctionStmt("COALESCE", "SUM(ii.total),0");
	$fr = new FromStmt("invoice_items", "ii");
	$wh = new WhereClause();
	$wh->addSimpleItem("ii.invoice_id", new DbField("iv.id"), 'AND');
	$wh->addSimpleItem('ii.domain_id', new DbField('iv.domain_id'));
	$se = new Select($fn, $fr, $wh, "invoice_total");
	$pdoDb->addToSelectStmts($se);
	
	$fn = new FunctionStmt("COALESCE", "SUM(ac_amount),0");
	$fr = new FromStmt("payment", "ap");
	$wh = new WhereClause();
	$wh->addSimpleItem("ap.ac_inv_id", new DbField("iv.id"), 'AND');
	$wh->addSimpleItem('ap.domain_id', new DbField('iv.domain_id'));
	$se = new Select($fn, $fr, $wh, "INV_PAID");
	$pdoDb->addToSelectStmts($se);
	
	$fn = new FunctionStmt("DATE_FORMAT", "date, '%Y-%m-%d'", "date");
	$pdoDb->addToFunctions($fn);
	
	$fn = new FunctionStmt("CONCAT", "pf.pref_inv_wording, ' ', iv.index_id");
	$se = new Select($fn, null, null,"index_name");
	$pdoDb->addToSelectStmts($se);

	$jn = new Join("LEFT", "biller", "b");
	$jn->addSimpleItem("b.id", new DbField("iv.biller_id"), 'AND');
	$jn->addSimpleItem('b.domain_id', new DbField('iv.domain_id'));
	$pdoDb->addToJoins($jn);
	
	$jn = new Join("LEFT", "customers", "c");
	$jn->addSimpleItem("c.id", new DbField("iv.customer_id"), 'AND');
	$jn->addSimpleItem('c.domain_id', new DbField('iv.domain_id'));
	$pdoDb->addToJoins($jn);
	
	$jn = new Join("LEFT", "preferences", "pf");
	$jn->addSimpleItem("pf.pref_id", new DbField("iv.preference_id"), 'AND');
	$jn->addSimpleItem('pf.domain_id', new DbField("iv.domain_id"));
	$pdoDb->addToJoins($jn);

	$expr_list = array(
					   "iv.id",
					   "iv.domain_id",
					   "iv.owing",
					   "iv.last_activity_date",
					   "iv.aging_date",
					   "iv.age_days",
					   "iv.aging",
					   "iv.sales_representative",
					   new DbField("c.id", "cid"),
					   new DbField("iv.index_id", "index_id"),
					   new DbField("iv.type_id", "type_id"),
					   new DbField("b.name", "biller"),
					   new DbField("c.name", "customer"),
					   new DbField("pf.pref_description", "preference"),
					   new DbField("pf.status", "status"));
	$pdoDb->setSelectList($expr_list);
	
	$pdoDb->setGroupBy($expr_list);
	
	$pdoDb->setGroupBy('date', 'index_name');
	
	$rows = $pdoDb->request("SELECT", "invoices", "iv");
	
	$results = array();
	foreach($rows as $row) {
		$age_list = Array();
		/** cannot call private method **
		$age_list = Invoice::calculate_age_days(
											 $row['id'],
											 $row['date'],
											 $row['owing'],
											 $row['last_activity_date'],
											 $row['aging_date']);
		*/
		// The merge will update fields that exist and append those that don't.
		$results[] = array_merge($row, $age_list);
	}
	return $results;
	//return $rows;
}

$dir    = (isset($_POST['sortorder'])) ? $_POST['sortorder'] : "DESC";
$sort   = (isset($_POST['sortname']) ) ? $_POST['sortname']  : "id";
$rp     = (isset($_POST['rp'])       ) ? $_POST['rp']        : "25";
$having = (isset($_GET['having'])    ) ? $_GET['having']     : "";
$page   = (isset($_POST['page'])     ) ? $_POST['page']      : "1";
$query  = (isset($_POST['query'])    ) ? $_POST['query']     : null;
$qtype  = (isset($_POST['qtype'])    ) ? $_POST['qtype']     : null;
// @formatter:on

// If user role is customer or biller, then restrict invoices to those they
// have access to. Make customer access read only. Billers change work only
// on those invoices generated for them.
$read_only = ($auth_session->role_name == 'customer');

if (!empty($having)) {
    $pdoDb->setHavings(Invoice::buildHavings($having));
}

// @formatter:off
//$invoices = Invoice::select_all(''     , $sort, $dir, $rp, $page, $qtype, $query);
//$invoice_count = count(Invoice::select_all('count', $sort, $dir, $rp, $page, $qtype, $query));
$invoices = my_select_all(''     , $sort, $dir, $rp, $page, $qtype, $query);
$invoice_count = count(my_select_all('count', $sort, $dir, $rp, $page, $qtype, $query));

$xml  = "";
//$xml .= "<rows other='". print_r($invoices, true). "'>";
$xml .= "<rows>";
$xml .= "<page>$page</page>";
$xml .= "<total>$invoice_count</total>";

foreach ($invoices as $row) {
//	$xml .= "<row id='" . $row['id']. "' other='". print_r($invoices, true). "'>";
    $xml .= "<row id='" . $row['id']. "'>";
    $xml .=
        "<cell><![CDATA[" .
            "<a class='index_table' title='" .
                $LANG['quick_view_tooltip'] . " " .
                $row['preference'] . " " .
                $row['index_id'] .
                "' href='index.php?module=invoices&view=quick_view&id=" .
                $row['id'] . "'>" .
                "<img src='images/common/view.png' class='action' />" .
            "</a>";
    if (!$read_only) {
        $xml .=
            "<a class='index_table' title='" .
                $LANG['edit_view_tooltip']. " " .
                $row['preference']. " " .
                $row['index_id'].
                "' href='index.php?module=invoices&view=details&id=".
                $row['id'].
                "&action=view'><img src='images/common/edit.png' class='action' />".
            "</a>";
		/**/
		$xml .=
			"<a class='index_table' title='".
				$LANG['new_invoice']. " (". $row['customer']. ")".
				"' href='index.php?module=invoices&view=usedefault&customer_id=".
				$row['cid'].
				"&action=view'>".
				"<img src='images/common/new-copy.png' class='action' alt='new invoice' />".
			"</a>";
		/*^*/
    }
    $xml .= "<!--2 PRINT VIEW -->" .
             "<a class='index_table' title='" .
                $LANG['print_preview_tooltip'] . " " . $row['preference'] . " " . $row['index_id'] .
                "' href='index.php?module=export&view=invoice&id=" . $row['id'] . "&format=print'>".
                "<img src='images/common/printer.png' class='action' />" .
             "</a>" .
             "<!--3 EXPORT TO PDF DIALOG -->" .
             "<a title='" .
                $LANG['export_tooltip'] . " " .
                $row['preference'] . " " .
                $row['index_id'] . "' class='invoice_export_dialog' href='#' rel='{$row['id']}' " .
                                   "data_spreadsheet='{$config->export->spreadsheet}' " .
                                   "data_wordprocessor='{$config->export->wordprocessor}'>" .
                                   "<img src='images/common/page_white_acrobat.png' class='action' />" .
                                   "</a>";
    if (!$read_only) {
        // Alternatively: The Owing column can have the link on the amount instead of the payment icon code here
        if ($row['status'] && $row['owing'] > 0) {
            // Real Invoice Has Owing - Process payment
            $xml .= "<!--6 Payment -->" .
                        "<a title='" .
                            $LANG['process_payment_for'] . " " .
                            $row['preference'] . " " .
                            $row['index_id'] .
                            "' class='index_table' href='index.php?module=payments&view=process&id=" .
                            $row['id'] .
                            "&op=pay_selected_invoice'>" .
                            "<img src='images/common/money_dollar.png' class='action' />" .
                        "</a>";
        } elseif ($row['status']) {
            // Real Invoice Payment Details if not Owing (get different color payment icon)
            $xml .= "<!--6 Payment -->" .
                        "<a title='" .
                            $LANG['process_payment_for'] . " " .
                            $row['preference'] . " " .
                            $row['index_id'] .
                            "' class='index_table' href='index.php?module=payments&view=details&ac_inv_id=" .
                            $row['id'] .
                            "&action=view'>" .
                            "<img src='images/common/money_dollar.png' class='action' />" .
                        "</a>";
        } else {
            // Draft Invoice Just Image to occupy space till blank or greyed out icon becomes available
            $xml .= "<!--6 Payment --><img src='images/common/money_dollar.png' class='action' />";
        }
        $xml .= "<!--7 Email -->" .
                    "<a title='" .
                        $LANG['email'] . " " .
                        $row['preference'] . " " .
                        $row['index_id'] .
                        "' class='index_table' href='index.php?module=invoices&view=email&stage=1&id=" .
                        $row['id'] . "'>" .
                        "<img src='images/common/mail-message-new.png' class='action' />" .
                    "</a>";
    }
    $xml .= "]]></cell>";
    $xml .= "<cell><![CDATA[" . $row['index_name']                     . "]]></cell>";
    $xml .= "<cell><![CDATA[" . $row['biller']                         . "]]></cell>";
    $xml .= "<cell><![CDATA[" . $row['customer']                       . "]]></cell>";
    $xml .= "<cell><![CDATA[" . siLocal::date($row['date'])            . "]]></cell>";
    $xml .= "<cell><![CDATA[" . siLocal::number($row['invoice_total']) . "]]></cell>";
    if ($row['status']) {
        $xml .= "<cell><![CDATA[" . siLocal::number($row['owing']) . "]]></cell>";
        $xml .= "<cell><![CDATA[" . $row['aging']                  . "]]></cell>";
    } else {
        $xml .= "<cell><![CDATA[&nbsp;]]></cell>";
        $xml .= "<cell><![CDATA[&nbsp;]]></cell>";
    }
    $xml .= "<cell><![CDATA[" . $row['preference'] . "]]></cell>";
    $xml .= "</row>";
}
$xml .= "</rows>";
// @formatter:on

echo $xml;
