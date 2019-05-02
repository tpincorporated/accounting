<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/location.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['LocationSaveEdit'])){
		if($_POST['LocationSaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITWHSE);
			$addaccess = hasAccess(USERID,ACCESSADDWHSE);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

				$type = escapeString($_POST['type']);
				$code = escapeString(strtoupper(trim($_POST['code'])));
				$desc = escapeString($_POST['desc']);
				$statusflag = escapeString($_POST['statusflag']);
				$userid = USERID;
				$now = date('Y-m-d H:i:s');
				$locationclass = new warehouse();
				$systemlog = new system_log();


				if($source=='edit'){
					$id = escapeString($_POST['id']);
					$query = "select * from warehouse where code='$code' and id!='$id'";
				}
				else{
					$query = "select * from warehouse where code='$code'";
				}
				$rs = query($query);

				if(getNumRows($rs)==0){
				
					if($source=='add'){
						$locationclass->insert(array('',$code,$desc,$userid,$now,'NULL','NULL',$statusflag,$type));
						$id = $locationclass->getInsertId();
						$systemlog->logAddedInfo($locationclass,array($id,$code,$desc,$userid,$now,'NULL','NULL',$statusflag,$type),'WAREHOUSE','New Warehouse Added',$userid,$now);
						echo "success";
					}
					else if($source=='edit'){
							$id = escapeString($_POST['id']);
						
							$systemlog->logEditedInfo($locationclass,$id,array('',$code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag,$type),'WAREHOUSE','Edited Warehouse Info',$userid,$now);/// log should be before update is made
							$locationclass->update($id,array($code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag,$type));
							echo "success";

					}
				}
				else{
					echo "codeexists";
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

	

    if(isset($_POST['deleteSelectedRows'])){
        if($_POST['deleteSelectedRows']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$access = hasAccess(USERID,ACCESSDELETEWHSE);

        	if($access==1){

	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where id in ('".implode("','", $data)."')";
		        }

		        $rs = query("select * from warehouse $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$code = $obj->code;
		        	$desc = $obj->description;

		        	$deleters = query("delete from warehouse where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('WAREHOUSE',"Deleted Warehouse","id=$id | code=$code | description=$desc",$userid,$now);
		        	}
		        }


		        echo "success";
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }



?>

