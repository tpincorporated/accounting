<?php
	include('../../../config/connection.php');
	include('../../../config/functions.php');




	$page = 1;	// The current page
	$sortname = '';	// Sort column
	$sortorder = '';	// Sort order
	$qtype = '';	// Search column
	$query = '';	// Search string

	// Get posted data
	if (isset($_POST['page'])) {
		$page = mysql_real_escape_string($_POST['page']);
	}
	if (isset($_POST['sortname'])) {
		$sortname = mysql_real_escape_string($_POST['sortname']);
	}
	if (isset($_POST['sortorder'])) {
		$sortorder = mysql_real_escape_string($_POST['sortorder']);
	}
	if (isset($_POST['qtype'])) {
		$qtype = mysql_real_escape_string($_POST['qtype']);
	}
	if (isset($_POST['query'])) {
		$query = mysql_real_escape_string($_POST['query']);
	}
	if (isset($_POST['rp'])) {
		$rp = mysql_real_escape_string($_POST['rp']);
	}

	// Setup sort and search SQL using posted data
	$sortSql = "order by $sortname $sortorder";
	$searchSql = ($qtype != '' && $query != '') ? "where $qtype like '%$query%'" : '';


	// Get total count of records
	$query = "      select warehouse.id,
						   warehouse.code, 
						   warehouse.description,
						   warehouse.created_date,
						   concat(cuser.first_name,' ',cuser.last_name) as created_by,
						   warehouse.updated_date,
						   concat(uuser.first_name,' ',uuser.last_name) as updated_by,
						   warehouse.active_flag,
						   case 
						   		when warehouse.active_flag=1 then 'YES'
						   		else 'NO'
						   end as activeflag,
						   warehouse.warehouse_type_id,
						   warehouse_type.description as warehousetype
					from warehouse
					left join warehouse_type on warehouse_type.id=warehouse.warehouse_type_id
					left join user as cuser on cuser.id=warehouse.created_by
					left join user as uuser on uuser.id=warehouse.updated_by";

	$sql = $query." $searchSql";
	$result = mysql_query($sql);
	$row = mysql_fetch_array($result);
	$total = mysql_num_rows($result);

	// Setup paging SQL
	$pageStart = ($page-1)*$rp;
	$limitSql = "limit $pageStart, $rp";

	// Return JSON data
	$data = array();
	$data['page'] = $page;
	$data['total'] = $total;
	$data['rows'] = array();
	$sql = "select *
			from (
			        $query
				  ) as tbl
			$searchSql
			$sortSql
			$limitSql";

			
	$results = mysql_query($sql);
	$line = 1;
	while ($obj = mysql_fetch_object($results)) {
		$code = utfEncode($obj->code);
		$desc = utfEncode($obj->description);
		$createdby = utfEncode($obj->created_by);
		$createddate = $obj->created_date;
		$updatedby = utfEncode($obj->updated_by);
		$updateddate = $obj->updated_date;
		$flag = $obj->active_flag;
		$status = utfEncode($obj->activeflag);
		$whsetypeid = utfEncode($obj->warehouse_type_id);
		$whsetype = utfEncode($obj->warehousetype);
		$id = $obj->id;
		$editbtn = (userAccess(USERID,'.editlocationbtn')==false)?"<img src='../resources/flexigrid/images/edit.png' rowid='$id' code='$code' desc='$desc' activeflag='$flag' warehousetypeid='$whsetypeid' warehousetype='$whsetype' title='Edit Warehouse' class='editlocationbtn pointer' data-toggle='modal' href='#editlocationmodal' height='20px'>":'';
		$data['rows'][] = array(
									'id' => $id,
									'cell' => array(
													 $editbtn,
													 $id, 
													 $code,
													 $desc,
													 $status,
													 $whsetype,
													 $createdby,
													 $createddate,
													 $updatedby,
													 $updateddate

													),
									'rowAttr'=>array(
													   'rowid'=>$id
													)
								);
		$line++;
	}
	echo json_encode($data);
?>