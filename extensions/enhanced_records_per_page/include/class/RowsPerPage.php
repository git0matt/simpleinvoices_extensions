<?php
/**
 * RowsPerPage class
 * @author git0matt@gmail.com
 *
 */
class RowsPerPage {

    /**
     * Static function to add the columns to the system_defaults
     * table if it is not present.
     */
    public static function addSystemDefaultFields() {
        global $LANG, $dbh;

        $fld = "character_maximum_length";
        $sql = "SELECT `$fld` FROM `information_schema`.`columns`
                WHERE `table_name`='" . TB_PREFIX . "system_defaults' AND `column_name`='value';";
        if (($sth = $dbh->query($sql)) === false) {
            // Non-critical error so continue with next action.
            error_log("RowsPerPage - addSystemDefaultFields(): Unable to perform request: $sql");
        } else {
            $row = $sth->fetch(PDO::FETCH_ASSOC);
            if (intval($row[$fld]) < 60) {
                $sql = "ALTER TABLE `" . TB_PREFIX . "system_defaults` MODIFY COLUMN `value` varchar(60);";
                if (($sth = $dbh->query($sql)) === false) {
                    // Non-critical error so continue with next action.
                    error_log("RowsPerPage - addSystemDefaultFields() - Unable to perform request: $sql");
                }
            }
        }

        // @formatters:off
        $flds = array('show_rp', 'default_rp', 'default_rp_invoices', 'default_rp_payments', 'default_rp_customers', 'default_rp_billers', 'default_rp_users', 'default_rp_products', 'default_rp_extensions');
        $sql = "SELECT `name` FROM `" . TB_PREFIX . "system_defaults`
                WHERE `name` IN ('" . implode("', '", $flds) . "');";
        // @formatter:on
        if (($sth = $dbh->query($sql)) === false) {
            error_log("RowsPerPage - addSystemdefaultFields(): Unable to perform request: $sql");
            return false;
        }

        $ok = true;
        $names = $sth->fetchAll(PDO::FETCH_COLUMN, 'name');
        if (count($names) != count($flds)) {
            $domain_id = domain_id::get();
			$ext_id = getExtensionID('enhanced_records_per_page');
            $dbh->beginTransaction();
            foreach ($flds as $fld) {
                if (array_search($fld,$names) === false) {
                    // @formatter:off
                    $sql = "INSERT INTO `" . TB_PREFIX . "system_defaults`
                                             (`domain_id` , `name`, `value`, `extension_id`)";
                    switch ($fld) {
                        case 'show_rp':
                            $sql .= " VALUES ('$domain_id', 'show_rp', 1, $ext_id);";
                            break;

                        case 'default_rp':
                            $sql .= " VALUES ('$domain_id', 'default_rp', 4, $ext_id);";
                            break;

						case 'default_rp_invoices':
							$sql .= " VALUES ('$domain_id', 'default_rp_invoices', 20, $ext_id);";
							break;
							
						case 'default_rp_payments':
							$sql .= " VALUES ('$domain_id', 'default_rp_payments', 20, $ext_id);";
							break;
							
						case 'default_rp_customers':
							$sql .= " VALUES ('$domain_id', 'default_rp_customers', 20, $ext_id);";
							break;
							
						case 'default_rp_billers':
							$sql .= " VALUES ('$domain_id', 'default_rp_billers', 20, $ext_id);";
							break;
							
						case 'default_rp_users':
							$sql .= " VALUES ('$domain_id', 'default_rp_users', 20, $ext_id);";
							break;
							
						case 'default_rp_products':
							$sql .= " VALUES ('$domain_id', 'default_rp_products', 20, $ext_id);";
							break;
							
						case 'default_rp_extensions':
							$sql .= " VALUES ('$domain_id', 'default_rp_extensions', 20, $ext_id);";
							break;
							
                        default:
                            $ok = false;
                            error_log("RowsPerPage - addSystemDefaultFields(): Invalid field name, $fld.");
                            break;
                    }
                    // @formatter:on
                    if ($ok) {
                        if (($dbh->exec($sql)) === false) {
                            $ok = false;
                            error_log("RowsPerPage - addSystemDefaultFields(): Failed to insert new record. sql[$sql]");
                            break;
                        }
                    }
                }
            }

            // @formatter:off
            if ($ok) $dbh->commit();
            else     $dbh->rollback();
            // @formatter:on
        }

        return $ok;
    }

}
