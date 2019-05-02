<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/category.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['categorySaveEdit'])){
		if($_POST['categorySaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITCTGY);
			$addaccess = hasAccess(USERID,ACCESSADDCTGY);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

					$code = escapeString(strtoupper(trim($_POST['code'])));
					$desc = escapeString($_POST['desc']);
					$statusflag = escapeString($_POST['statusflag']);
					$userid = USERID;
					$now = date('Y-m-d H:i:s');
					$categoryclass = new category();
					$systemlog = new system_log();


					if($source=='edit'){
						$id = escapeString($_POST['id']);
						$query = "select * from category where code='$code' and id!='$id'";
					}
					else{
						$query = "select * from category where code='$code'";
					}
					$rs = query($query);

					if(getNumRows($rs)==0){
					
						if($source=='add'){
							$categoryclass->insert(array('',$code,$desc,$userid,$now,'NULL','NULL',$statusflag));
							$id = $categoryclass->getInsertId();
							$systemlog->logAddedInfo($categoryclass,array($id,$code,$desc,$userid,$now,'NULL','NULL',$statusflag),'CATEGORY','New Category Added',$userid,$now);
							echo "success";
						}
						else if($source=='edit'){
								$id = escapeString($_POST['id']);
							
								$systemlog->logEditedInfo($categoryclass,$id,array('',$code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag),'CATEGORY','Edited Category Info',$userid,$now);/// log should be before update is made
								$categoryclass->update($id,array($code,$desc,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag));
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

        	$access = hasAccess(USERID,ACCESSDELETECTGY);

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

		        $rs = query("select * from category $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$code = $obj->code;
		        	$desc = $obj->description;

		        	$deleters = query("delete from category where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('CATEGORY',"Deleted Category","id=$id | code=$code | description=$desc",$userid,$now);
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

