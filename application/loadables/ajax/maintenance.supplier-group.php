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


	$customqry =   "select supplier_group.id,
						   supplier_group.code, 
						   supplier_group.description,
						   supplier_group.created_date,
						   concat(cuser.first_name,' ',cuser.last_name) as created_by,
						   supplier_group.updated_date,
						   concat(uuser.first_name,' ',uuser.last_name) as updated_by,
						   supplier_group.active_flag,
						   case 
						   		when supplier_group.active_flag=1 then 'YES'
						   		else 'NO'
						   end as activeflag
					from supplier_group
					left join user as cuser on cuser.id=supplier_group.created_by
					left join user as uuser on uuser.id=supplier_group.updated_by";

	// Setup sort and search SQL using posted data
	$sortSql = "order by $sortname $sortorder";
	$searchSql = ($qtype != '' && $query != '') ? "where $qtype like '%$query%'" : '';


	// Get total count of records
	$sql = "select * from ( $customqry ) as tbl $searchSql";
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
			        $customqry
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
		$id = $obj->id;
		$flag = $obj->active_flag;
		$statusflag = utfEncode($obj->activeflag);
		$editbtn = (userAccess(USERID,'.editsuppliergroupbtn')==false)?"<img src='../resources/flexigrid/images/edit.png' rowid='$id' code='$code' desc='$desc' activeflag='$flag' title='Edit Supplier Group' class='editsuppliergroupbtn pointer' data-toggle='modal' href='#editsuppliergroupmodal' height='20px'>":'';

		$data['rows'][] = array(
									'id' => $id,
									'cell' => array(
													 $editbtn,
													 $id, 
													 $code,
													 $desc,
													 $statusflag,
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