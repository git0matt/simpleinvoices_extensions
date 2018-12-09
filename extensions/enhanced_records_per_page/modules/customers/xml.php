<?php

global $LANG;

header("Content-type: text/xml");

// @formatter:off
$dir   = (isset($_POST['sortorder'])) ? $_POST['sortorder'] : "ASC";
$sort  = (isset($_POST['sortname']) ) ? $_POST['sortname']  : "name";
$rp    = (isset($_POST['rp'])       ) ? $_POST['rp']        : "25";
$page  = (isset($_POST['page'])     ) ? $_POST['page']      : "1";
// @formatter:on

/** Modified from include/class/Customer.php *
 * Select records for the flexigrid list
 * @param $type
 * @param $dir
 * @param $sort
 * @param $rp
 * @param $page
 * @return array|mixed
 */
function sql($type, $dir, $sort, $rp, $page)
{
	global $LANG, $pdoDb;
	
	try {
		$valid_search_fields = array(
									 "c.id",
									 "c.name",
									 "c.department",
									 "c.enabled",
									 "c.street_address",
									 "c.city",
									 "c.state",
									 "c.phone",
									 "c.mobile_phone",
									 "c.email",
									 "c.attention"
									 );
		
		$query = isset($_POST['query']) ? $_POST['query'] : null;
		$qtype = isset($_POST['qtype']) ? $_POST['qtype'] : null;
		if (!empty($qtype) && !empty($query)) {
			if (in_array($qtype, $valid_search_fields)) {
				$pdoDb->addToWhere(new WhereItem(false, $qtype, "LIKE", "%$query%", false, "AND"));
			}
		}
		$pdoDb->addSimpleWhere("c.domain_id", domain_id::get());
		
		if ($type == "count") {
			$pdoDb->addToFunctions("COUNT(*) AS count");
			$rows = $pdoDb->request("SELECT", "customers", "c");
			return $rows[0]['count'];
		}
		
		if (intval($page) != $page) $page = 1;
		if (intval($rp) != $rp) $rp = 25;
		
		$start = (($page - 1) * $rp);
		
		$expr_list = array(
						   new DbField("c.id", "CID"),
						   "c.domain_id",
						   "c.name",
						   "c.department",
						   "c.enabled",
						   "c.street_address",
						   "c.city",
						   "c.state",
						   "c.phone",
						   "c.mobile_phone",
						   "c.email",
						   "c.attention"
						   );
		$pdoDb->setSelectList($expr_list);
		$pdoDb->setGroupBy($expr_list);
		
		$case = new CaseStmt("c.enabled", "enabled_txt");
		$case->addWhen("=", ENABLED, $LANG['enabled']);
		$case->addWhen("!=", ENABLED, $LANG['disabled'], true);
		$pdoDb->addToCaseStmts($case);
		
		$fn = new FunctionStmt("COALESCE", "SUM(ii.total), 0", "total");
		$fr = new FromStmt("invoice_items", "ii");
		$jn = new Join("INNER", "invoices", "iv");
		$oc = new OnClause();
		$oc->addSimpleItem("iv.id", new DbField("ii.invoice_id"), "AND");
		$oc->addSimpleItem("iv.domain_id", new DbField("ii.domain_id"));
		$jn->setOnClause($oc);
		$wh = new WhereClause();
		$wh->addSimpleItem("iv.customer_id", new DbField("CID"), "AND");
		$wh->addSimpleItem("iv.domain_id", new DbField("ii.domain_id"));
		$se = new Select($fn, $fr, $wh, "customer_total");
		$se->addJoin($jn);
		$pdoDb->addToSelectStmts($se);
		
		$fn = new FunctionStmt("MAX", new DbField("iv.id"));
		$fr = new FromStmt("invoices", "iv");
		$wh = new WhereClause();
		$wh->addSimpleItem("iv.customer_id", new DbField("CID"), "AND");
		$wh->addSimpleItem("iv.domain_id", new DbField("c.domain_id"));
		$se = new Select($fn, $fr, $wh, "last_inv_id");
		$pdoDb->addToSelectStmts($se);
		
		$fn = new FunctionStmt("COALESCE", "SUM(ap.ac_amount), 0", "amount");
		$fr = new FromStmt("payment", "ap");
		$jn = new Join("INNER", "invoices", "iv");
		$oc = new OnClause();
		$oc->addSimpleItem("iv.id", new DbField("ap.ac_inv_id"), "AND");
		$oc->addSimpleItem("iv.domain_id", new DbField("ap.domain_id"));
		$jn->setOnClause($oc);
		$wh = new WhereClause();
		$wh->addSimpleItem("iv.customer_id", new DbField("CID"), "AND");
		$wh->addSimpleItem("iv.domain_id", new DbField("ap.domain_id"));
		$se = new Select($fn, $fr, $wh, "paid");
		$se->addJoin($jn);
		$pdoDb->addToSelectStmts($se);
		
		$fn = new FunctionStmt(null, "customer_total");
		$fn->addPart("-", "paid");
		$se = new Select($fn, null, null, "owing");
		$pdoDb->addToSelectStmts($se);
		
		$validFields = array('CID', 'name', 'department', 'customer_total', 'paid', 'owing', 'enabled');
		if (in_array($sort, $validFields)) {
			$dir = (preg_match('/^(asc|desc)$/iD', $dir) ? 'A' : 'D');
			$sortlist = array(array("enabled", "D"), array($sort, $dir));
		} else {
			$sortlist = array(array("enabled", "D"), array("name", "A"));
		}
		$pdoDb->setOrderBy($sortlist);
		
		$pdoDb->setLimit($rp, $start);
		
		$rows = $pdoDb->request("SELECT", "customers", "c");
		
		$result = array();
		foreach($rows as $row)
		{
			if ($row['last_inv_id'] > 0) {
				$pdoDb->addSimpleWhere('id', $row['last_inv_id']);
				$pdoDb->setSelectList('index_id');
				$recs = $pdoDb->request("SELECT", 'invoices');
				$row['last_invoice'] = $recs[0]['index_id'];
			} else {
				$row['last_invoice'] = '0';
			}
			$result[] = $row;
		}
	}
	catch (PdoDbException $pde)
	{
		return array();
	}
	return $result;
}
/****/

//$customers = Customer::sql('', $dir, $sort, $rp, $page);
//$count = Customer::sql('count', $dir, $sort, $rp, $page);
$customers = sql('', $dir, $sort, $rp, $page);
$count = sql('count', $dir, $sort, $rp, $page);

$xml  = "";
$xml .= "<rows>";
$xml .= "<page>$page</page>";
$xml .= "<total>$count</total>";

$viewcust = $LANG['view']. ' '. $LANG['customer'];
$editcust = $LANG['edit']. ' '. $LANG['customer'];
$defaultinv = $LANG['new_uppercase']. ' '. $LANG['invoice'];//$LANG['default_invoice'];
foreach ($customers as $row)
{
	$vname = $viewcust. ' '. $row['name'];
	$ename = $editcust. ' '. $row['name'];
	$image = ($row['enabled'] == 0 ? 'images/common/cross.png' : 'images/common/tick.png');
	$xml .= "<row id='{$row['CID']}'>";
	$xml .=
		"<cell><![CDATA[" .
		  "<a class='index_table' title='$vname' href='index.php?module=customers&view=details&id={$row['CID']}&action=view'>" .
			"<img src='images/common/view.png' class='action' alt='view' />" .
		  "</a>" .
		  "<a class='index_table' title='$ename' href='index.php?module=customers&view=details&id={$row['CID']}&action=edit'>".
			"<img src='images/common/edit.png' class='action' alt='edit' />" .
		  "</a>" .
		  "<a class='index_table' title='$defaultinv' href='index.php?module=invoices&view=usedefault&customer_id={$row['CID']}&action=view'>" .
			"<img src='images/common/add.png' class='action' alt='new invoice' />" .
		  "</a>" .
	"]]></cell>";
	$xml .= "<cell><![CDATA[{$row['CID']}]]></cell>";
	$info = $row['street_address']. ' '. $row['city'];
	if (isset($row['phone']) && $row['phone'] != '')
		$info .= ' ph.'. $row['phone'];
	if (isset($row['mobile_phone']) && $row['mobile_phone'] != '')
		$info .= ' (mob.'. $row['mobile_phone']. ')';
	$xml .= "<cell><![CDATA[<a href='#' title='{$info}'>{$row['name']}</a>]]></cell>";
	//$xml .= "<cell><![CDATA[{$row['department']}]]></cell>";
	//$xml .= "<cell><![CDATA[<a href='#' class='cluetip' title='". $info. "'>". $row['attention']. "</a>]]></cell>";
	$xml .= "<cell><![CDATA[". $row['attention']. "]]></cell>";
	$xml .= "<cell><![CDATA[<a class='index_table' title='quick view' " .
							  "href='index.php?module=invoices&amp;view=quick_view&amp;id={$row['last_inv_id']}'>{$row['last_invoice']}" .
						   "</a>" .
					"]]></cell>";
	//$xml .= "<cell><![CDATA[" . siLocal::number($row['customer_total']) . "]]></cell>";
	if ($row['paid'] > 1)
		$xml .= "<cell><![CDATA[" . siLocal::number($row['paid']). "]]></cell>";
	else
		$xml .= "<cell><![CDATA[" . siLocal::number(0). "]]></cell>";
	//$xml .= "<cell><![CDATA[" . siLocal::number($row['paid']) . "]]></cell>";
	if ($row['owing'] > 1)
		$xml .= "<cell><![CDATA[" . siLocal::number($row['owing']). "]]></cell>";
	elseif ($row['owing'] < -1)
		$xml .= "<cell><![CDATA[(" . siLocal::number($row['owing']). ")]]></cell>";
	else
		$xml .= "<cell><![CDATA[" . siLocal::number(0). "]]></cell>";
	//$xml .= "<cell><![CDATA[" . siLocal::number($row['owing']) . "]]></cell>";
	$xml .= "<cell><![CDATA[<img src='$image' alt='{$row['enabled_txt']}' title='{$row['enabled_txt']}' />]]></cell>";
	$xml .= "</row>";
}
$xml .= "</rows>";

echo $xml;
