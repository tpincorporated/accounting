<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/terms.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['termsSaveEdit'])){
		if($_POST['termsSaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITTERMS);
			$addaccess = hasAccess(USERID,ACCESSADDTERMS);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

					$code = escapeString(strtoupper(trim($_POST['code'])));
					$desc = escapeString($_POST['desc']);
					$statusflag = escapeString($_POST['statusflag']);
					$days = escapeString($_POST['days']);
					$days = is_numeric(trim($days))==1?$days:'NULL';
					$userid = USERID;
					$now = date('Y-m-d H:i:s');
					$termsclass = new terms();
					$systemlog = new system_log();


					if($source=='edit'){
						$id = escapeString($_POST['id']);
						$query = "select * from terms where code='$code' and id!='$id'";
					}
					else{
						$query = "select * from terms where code='$code'";
					}
					$rs = query($query);

					if(getNumRows($rs)==0){
					
						if($source=='add'){
							$termsclass->insert(array('',$code,$desc,$days,$userid,$now,'NULL','NULL',$statusflag));
							$id = $termsclass->getInsertId();
							$systemlog->logAddedInfo($termsclass,array($id,$code,$desc,$days,$userid,$now,'NULL','NULL',$statusflag),'TERMS','New Terms Added',$userid,$now);
							echo "success";
						}
						else if($source=='edit'){
								$id = escapeString($_POST['id']);
							
								$systemlog->logEditedInfo($termsclass,$id,array('',$code,$desc,$days,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag),'TERMS','Edited Terms Info',$userid,$now);/// log should be before update is made
								$termsclass->update($id,array($code,$desc,$days,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag));
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

        	$access = hasAccess(USERID,ACCESSDELETETERMS);

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

		        $rs = query("select * from terms $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$code = $obj->code;
		        	$desc = $obj->description;
		        	$days = $obj->days;

		        	$deleters = query("delete from terms where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('TERMS',"Deleted Terms","id=$id | code=$code | description=$desc | Days=$days",$userid,$now);
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

