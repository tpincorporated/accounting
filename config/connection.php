<?php

	$host = "127.0.0.1";
	$dbname = "tpi_acct";
	$username = "root";
	$password = "root";

	@define('DBNAME', $dbname);

	
	@$conn = mysql_connect($host,$username,$password);
	@$db = mysql_select_db($dbname);
	if(!$conn){
		$errornum = mysql_errno();
		$errordesc = mysql_error();
		die('Database Error '.$errornum.':'.$errordesc);
	}
	else if(!$db){
		die('INVALID DATABASE');
	}

	date_default_timezone_set("asia/manila");
	
	