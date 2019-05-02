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


	$customqry =   "select client.id,
						   client.code,
						   client.description,
						   client.fax,
						   client.telephone,
						   client.mobile,
					       client.email,
						   client_group.description as clientgroup,
						   terms.description as terms,
						   client.created_date,
						   concat(cuser.first_name,' ',cuser.last_name) as created_by,
						   client.updated_date,
						   concat(uuser.first_name,' ',uuser.last_name) as updated_by,
						   client.active_flag,
						   case 
						   		when client.active_flag=1 then 'YES'
						   		else 'NO'
						   end as activeflag
					from client
					left join client_group on client_group.id=client_group_id
		        	left join terms on terms.id=term_id
					left join user as cuser on cuser.id=client.created_by
					left join user as uuser on uuser.id=client.updated_by";

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
		$clientgroup = $obj->clientgroup;
		$terms = $obj->terms;
		$fax = $obj->fax;
		$tel = $obj->telephone;
		$mobile = $obj->mobile;
		$email = $obj->email;
		$flag = $obj->active_flag;
		$statusflag = utfEncode($obj->activeflag);
		$editbtn = (userAccess(USERID,'.editcustomerbtn')==false)?"<img src='../resources/flexigrid/images/edit.png' rowid='$id' title='Edit Customer' class='editcustomerbtn pointer' data-toggle='modal' href='#editcustomermodal' height='20px'>":'';
		$addrbtn = (userAccess(USERID,'.viewcustomeraddressbtn')==false)?"<img src='../resources/img/home2.png' rowid='$id' title='View Customer Address' class='viewcustomeraddressbtn pointer' customer='$desc' height='20px'>":'';
		$contactbtn = (userAccess(USERID,'.viewcustomercontactbtn')==false)?"<img src='../resources/img/contact.png' rowid='$id' title='View Customer Contact' class='viewcustomercontactbtn pointer' height='20px'>":'';

		$rowbtn = array();
		if($editbtn!=''){
			array_push($rowbtn, $editbtn);
		}
		if($addrbtn!=''){
			array_push($rowbtn, $addrbtn);
		}
		if($contactbtn!=''){
			array_push($rowbtn, $contactbtn);
		}
		$rowbtn = implode("&nbsp;&nbsp;", $rowbtn);

		$data['rows'][] = array(
									'id' => $id,
									'cell' => array(
													 $rowbtn,
													 $id, 
													 $code,
													 $desc,
													 $statusflag,
													 $clientgroup,
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