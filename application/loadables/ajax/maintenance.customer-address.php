<?php
	include('../../../config/connection.php');
	include('../../../config/functions.php');

	$refID = isset($_GET['id'])?trim($_GET['id']," "):'';


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

	$customqry = "
				    select client_address.id,
				           client_address.client_id,
				           client_address.street,
				           client_address.district,
				           client_address.city,
				           client_address.region,
				           client_address.zip_code,
				           client_address.country,
				           client_address.created_date,
				           concat(cuser.first_name,' ',cuser.last_name) as created_by,
				           client_address.updated_date,
				           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
				           case 
						   		when client_address.default_flag=1 then 'YES'
						   		else 'NO'
						   end as default_flag,
						   case 
						   		when client_address.active_flag=1 then 'YES'
						   		else 'NO'
						   end as active_flag
				    from client_address
				    left join user as cuser on cuser.id=client_address.created_by
					left join user as uuser on uuser.id=client_address.updated_by
				    where client_id='$refID'
				";


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
			from ( $customqry ) as tbl
			$searchSql
			$sortSql
			$limitSql";

			//echo $sql;

		

			
	$results = mysql_query($sql);
	$line = 1;
	while ($obj = mysql_fetch_object($results)) {
		
		$id = $obj->id;
		$street = utfEncode($obj->street);
		$district = utfEncode($obj->district);
		$city = utfEncode($obj->city);
		$region = utfEncode($obj->region);
		$zip = utfEncode($obj->zip_code);
		$country = utfEncode($obj->country);
		$createdby = utfEncode($obj->created_by);
		$createddate = $obj->created_date;
		$updatedby = utfEncode($obj->updated_by);
		$updateddate = $obj->updated_date;
		$defaultflag = utfEncode($obj->default_flag);
		$activeflag = utfEncode($obj->active_flag);

		$checkbox = "<input type='checkbox' rowid='$id' class='customeraddressrowcheckbox'>";

		$defaultbtn = (userAccess(USERID,'.editcustomeraddressbtn')==false&&$defaultflag=='NO')?"<img src='../resources/img/flag1.png' rowid='$id' title='Tag as Default Address' class='tagasdefaultcustomeraddressbtn pointer' height='18px'>":'';
		$activebtn = (userAccess(USERID,'.editcustomeraddressbtn')==false&&$activeflag=='NO')?"<img src='../resources/img/active.png' rowid='$id' title='Tag as Active' class='tagasactivecustomeraddressbtn pointer' height='20px'>":'';
		$inactivebtn = (userAccess(USERID,'.editcustomeraddressbtn')==false&&$activeflag=='YES')?"<img src='../resources/img/inactive.png' rowid='$id' title='Tag as Inactive' class='tagasinactivecustomeraddressbtn pointer' height='20px'>":'';
		
		$rowbtn = array();
		if($defaultbtn!=''){
			array_push($rowbtn, $defaultbtn);
		}
		if($activebtn!=''){
			array_push($rowbtn, $activebtn);
		}
		if($inactivebtn!=''){
			array_push($rowbtn, $inactivebtn);
		}
		$rowbtn = implode("&nbsp;&nbsp;", $rowbtn);


		$data['rows'][] = array(
									'id' => $id,
									'cell' => array(
													 $checkbox,
													 $rowbtn,
													 $activeflag,
													 $defaultflag,
													 $street, 
													 $district,
													 $city,
													 $region,
													 $zip,
													 $country,
													 $createddate,
													 $createdby,
													 $updateddate,
													 $updatedby

													),
									'rowAttr'=>array(
													   'rowid'=>$id,
													   "class"=>'customeraddressrow pointer',
													   "street"=>$street,
													   "district"=>$district,
													   "city"=>$city,
													   "region"=>$region,
													   "zipcode"=>$zip,
													   "country"=>$country
													)

								);
		$line++;
	}
	echo json_encode($data);
?>