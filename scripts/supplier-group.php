<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/supplier-group.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['suppliergroupSaveEdit'])){
		if($_POST['suppliergroupSaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITSUPPGRP);
			$addaccess = hasAccess(USERID,ACCESSADDSUPPGRP);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

					$code = escapeString(strtoupper(trim($_POST['code'])));
					$desc = escapeString($_POST['desc']);
					$statusflag = escapeString($_POST['statusflag']);
					$userid = USERID;
					$now = date('Y-m-d H:i:s');
					$suppliergroupclass = new supplier_group();
					$systemlog = new system_log();


					if($source=='edit'){
						$id = escapeString($_POST['id']);
						$query = "select * from supplier_group where code='$code' and id!='$id'";
					}
					else{
						$query = "select * from supplier_group where code='$code'";
					}
					$rs = query($query);

					if(getNumRows($rs)==0){
					
						if($source=='add'){
							$suppliergroupclass->insert(array('',$code,$desc,$userid,$now,'NULL','NULL',$statusflag));
							$id = $suppliergroupclass->getInsertId();
							$systemlog->logAddedInfo($suppliergroupclass,array($id,$code,$desc,$userid,$now,'NULL','NULL',$statusflag),'SUPPLIER GROUP','New Supplier Group Added',$userid,$now);
							echo "success";
						}
						else if($source=='edit'){
								$id = escapeString($_POST['id']);
							
								$systemlog->logEditedInfo($suppliergroupclass,$id,array('',$code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag),'SUPPLIER GROUP','Edited Supplier Group Info',$userid,$now);/// log should be before update is made
								$suppliergroupclass->update($id,array($code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag));
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

        	$access = hasAccess(USERID,ACCESSDELETESUPPGRP);

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

		        $rs = query("select * from supplier_group $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$code = $obj->code;
		        	$desc = $obj->description;

		        	$deleters = query("delete from supplier_group where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('SUPPLIER GROUP',"Deleted Supplier Group","id=$id | code=$code | description=$desc",$userid,$now);
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

