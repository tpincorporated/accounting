<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/user.class.php");
    include("../classes/user-warehouse.class.php");
    include("../classes/system-log.class.php");
    //include('email-class.php');

	if(isset($_POST['userSaveEditTransaction'])){
		if($_POST['userSaveEditTransaction']=='sdfsdFJso#Nj@Ho1iss4z4$Oi#l'){

			$editaccess = hasAccess(USERID,ACCESSEDITUSER);
			$addaccess = hasAccess(USERID,ACCESSADDUSER);

			$source = escapeString($_POST['action']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

			
						$fname = flcapital(escapeString($_POST['fname']));
						$mname = flcapital(escapeString($_POST['mname']));
						$lname = flcapital(escapeString($_POST['lname']));
						$activeflag = escapeString($_POST['activeflag']);
						$loc = escapeString($_POST['loc']);
						$email = escapeString($_POST['email']);
						$username = escapeString(strtolower($_POST['username']));
						$usergroup = escapeString($_POST['usergroup']);
						@$otherlocarray = $_POST['otherloc'];


					

						 //randomPassword();
						$now = date('Y-m-d H:i:s');

						$userclass = new user();
						$systemlog = new system_log();

			
			
		
						$checking = false;
						if($source=='add'){
							$pwd = md5('12345');
							if(checkIfExist("user","where username='".$username."'")==false){	
								$rs = $userclass->insert(array('',$fname,$mname,$lname,$username,$pwd,$email,$activeflag,$loc,$now,USERID,'NULL','NULL',0,$usergroup));
								$id = $userclass->getInsertId();
								$systemlog->logAddedInfo($userclass,array($id,$fname,$mname,$lname,$username,$pwd,$email,$activeflag,$loc,$now,USERID,'NULL','NULL',0,$usergroup),'USER','New User Added',USERID,$now);
								$checking = true;
							}
							else{
								echo "usernameexist";
							}

						}
						else if($source=='edit'){
							$id = escapeString($_POST['id']);
							if(checkIfExist("user","where username='".$username."' and id!='".$id."'")==false){
								$systemlog->logEditedInfo($userclass,$id,array($id,$fname,$mname,$lname,$username,'NOCHANGE',$email,$activeflag,$loc,$now,USERID,'NULL','NULL',0,$usergroup),'USER','Edited User Info',USERID,$now);/// log should be before update is made
								$rs = $userclass->update($id,array($fname,$mname,$lname,$username,'NOCHANGE',$email,$activeflag,$loc,$now,USERID,'NULL','NULL',0,$usergroup));
								$checking = true;
							}
							else{
								echo "usernameexist";
							}
						}

						if($checking==true){
								////////// USER RIGHTS ///////////////////
								query("delete from user_rights where user_id='$id'");
								@$useraccess = $_POST['useraccess'];
								$accesscount = count($useraccess);
								for($i=0;$i<$accesscount;$i++){
									$access = escapeString($useraccess[$i]);
									$query = "insert into user_rights(user_id, menu_id) values('$id','$access')";
									$rs = query($query);
								}
								/////////////////////////////////////



								/**** OTHER WAREHOUSE ***/
								$userlocclass = new user_warehouse();
								$userlocclass->deleteWhere("where user_id=".$id);
								$locdata = array();
								
								if($_POST['otherloc']!=null){
									for($i=0;$i<count($otherlocarray);$i++){
										$otherloc = array();
										array_push($otherloc, $id, $otherlocarray[$i]);
										array_push($locdata, $otherloc);
									}
									if(count($otherlocarray)>0){
										$userlocclass->insertMultiple($locdata);
									}
								}
								/**** OTHER WAREHOUSE - END ***/


								

								echo "success";



						}

			}
			else if($source=='edit'){
				echo "noeditpermission";
			}
			else if($source=='add'){
				echo "noaddpermission";
			}
			else{
				echo "sourceundefined";
			}

						
				

		
					
		
		}				
	}

	if(isset($_POST['deleteselected'])){
        if($_POST['deleteselected']=='sdfsdDNLWO1DNSJD3FOINLW3@#f'){

        	$access = hasAccess(USERID,ACCESSDELETEUSER);

        	if($access==1){
	        	@$data = $_POST['id'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $unabletodelete = array();

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where id in ('".implode("','", $data)."')";
		        }

		        $rs = query("select * from user $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$firstname = $obj->first_name;
		        	$lastname = $obj->last_name;
		        	$username = $obj->username;
		        	$email = $obj->email_address;
		        	$createddate = dateFormat($obj->created_date,'m/d/Y h:i:s A');
		        	$createdby = $obj->created_by;
		        	$updateddate = dateFormat($obj->updated_date,'m/d/Y h:i:s A');
		        	$updatedby = $obj->updated_by;


		        	$deleters = query("delete from user where id='$id'");
		        	if(!$deleters){
		        		//echo "ID: $id -".mysql_error()."\n";
		        		array_push($unabletodelete, "ID: $id, Name: $firstname $lastname");
		        	}
		        	else{
		        		$systemlog->logInfo('USER',"Deleted User","id=$id | first_name=$firstname | last_name=$lastname | username=$username | email_address=$email | created_date=$createddate | created_by=$createdby | updated_date=$updateddate | updated_by=$updatedby",$userid,$now);
		        	}
		        }

		        if(count($unabletodelete)==0){
		        	echo "success";
		        }
		        else{
		        	echo "Unable to delete User ID(s) used as foreign key:<br>".implode("<br>", $unabletodelete);
		        }
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }

	/*if(isset($_POST['deleteselected'])){
		$idarray = $_POST['id'];
		$tmp = array();
		foreach ($idarray as $id) {
			$delete = escapeString($id);
			array_push($tmp, $delete);
		}
		$deleteids = "(".implode(',', $tmp).")";
		$userclass = new User();
		$userclass->deleteMultiple($deleteids);
		echo "success";

	}*/

	if(isset($_POST['otherLocations'])){
		if($_POST['otherLocations']=='sdfed#n2L1hfi$n#opi3opod30napri'){
			$userid = escapeString($_POST['id']);
			$otherwhse = getUserOtherLocations($userid);

			$dataarray = array(
								 "otherwhse"=>$otherwhse
							  );
			print_r(json_encode($dataarray));

		}
	}

	if(isset($_POST['getusergroups'])){
		if($_POST['getusergroups']=='koI$BO#psoa5ni$n#opi3opod90jlknp'){
			$userid = escapeString($_POST['id']);
			$userug = getUserUsergoups($userid);

			$dataarray = array(
								 "usergroups"=>$userug
							  );
			print_r(json_encode($dataarray));

		}
	}


	if(isset($_POST['ki45lKJn3idlky'])){//reset user password
		if($_POST['ki45lKJn3idlky']=='3kh$klkddj4%l'){
			$id = escapeString($_POST['id']);
			$systemlog = new system_log();
			$pwd = '12345';
			$resetpword=md5($pwd);
			$now = date('Y-m-d H:i:s');
			$userid = USERID;
			$query = "update user set password='$resetpword', updated_date='$now', updated_by='$userid' where id='$id'";
			$rs=query($query);
			if($rs){
				if($userid==$id){
					$_SESSION['zfie@#MKLDFi934OPedieo'] = $resetpword;
				}
				$systemlog->logInfo('USER',"Reset Password","User ID: $id",$userid,$now);
				echo "success";
			}
		}
	}

	if(isset($_POST['KsornKdjeiu00doo93'])){//check if username exist
		if($_POST['KsornKdjeiu00doo93']=='KDlojs47kklqib'){
			$input = escapeString($_POST['input']);
			$query = "select * from user where username='$input'";
			$rs=query($query);
			$count = getNumRows($rs);
			if($count==1){
				echo 'exist';
			}
			else{
				echo "not exist";
			}
		}
	}

	if(isset($_POST['DLnslrii3hl34p03ddnfo4i'])){//edit user permission - checks exisiting user access
    	if($_POST['DLnslrii3hl34p03ddnfo4i']=='sdfei3opod30napri'){
    		$access = array();
    		$id = escapeString($_POST['id']);
    		$query = "select * from user_rights where user_id='$id'";
    		$rs = query($query);
    		while($obj=fetch($rs)){
    			array_push($access, $obj->menu_id);
    		}
    		echo implode(',', $access);
    	}
    }

	


?>