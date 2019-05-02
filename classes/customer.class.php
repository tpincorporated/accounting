<?php
require_once('table.class.php');
class client extends table{
	var $id; //primary key should always be the first variable in every entity class
	var $code;
	var $description;
	var $client_group_id;
	var $term_id;
	var $fax;
	var $telephone;
	var $mobile;
	var $email;
	var $created_by;
	var $created_date;
	var $updated_by;
	var $updated_date;
	var $active_flag;

}

?>