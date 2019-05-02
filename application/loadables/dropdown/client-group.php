<?php 
	include("../../../config/connection.php");
    include("../../../config/checkurlaccess.php");
    include("../../../config/checklogin.php");
    include("../../../config/functions.php");

	// strip tags may not be the best method for your project to apply extra layer of security but fits needs for this tutorial 
	$search = isset($_GET['q'])?strip_tags(trim($_GET['q'])):''; 
	$search = escapeString($search);

	$activeflag = isset($_GET['flag'])?$_GET['flag']:'';
	$condition1 = '';
	$condition2 = '';
	if(trim($activeflag)!=''){
		$condition1 = " and active_flag='$activeflag'";
		$condition2 = "where active_flag='$activeflag'";
	}

	// Do Prepared Query 
	if($search!=''){
		$query = query("select id,
		                       code,
		                       description
		            from client_group 
		            where (code like '%".$search."%' or description like '%".$search."%') $condition1
		            order by description asc
		            limit 40");
	}
	else{
		$query = query("select id,
		                   code,
		                   description
		            from client_group 
		            $condition2
		            order by description asc
		            limit 50");
	}	
	
	
	$rscount = getNumRows($query);
	if($rscount>0){
		$data[] = array('id' => 'NULL', 'text' => '-');
		while($obj=fetch($query)){
			$id = $obj->id;
			$code = utfEncode($obj->code);
			$desc = utfEncode($obj->description);
			$data[] = array('id' => $id, 'text' => $desc);		
		}
	}
	else{
		$data[] = array('id' => '', 'text' => 'No Results Found');
	}
	

	// return the result in json
	echo json_encode($data);

?>
