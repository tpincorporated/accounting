<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/supplier.class.php");
    include("../classes/supplier-address.class.php");
    include("../classes/supplier-contact.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['supplierSaveEdit'])){
		if($_POST['supplierSaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITSPPLR);
			$addaccess = hasAccess(USERID,ACCESSADDSPPLR);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

					$code = escapeString(strtoupper(trim($_POST['code'])));
					$desc = escapeString(strtoupper($_POST['desc']));
					$fax = escapeString(strtoupper($_POST['fax']));
					$tel = escapeString(strtoupper($_POST['tel']));
					$mobile = escapeString(strtoupper($_POST['mobile']));
					$email = escapeString(strtoupper($_POST['email']));
					$suppliergroup = escapeString(strtoupper($_POST['suppliergroup']));
					$terms = escapeString(strtoupper($_POST['terms']));
					$statusflag = escapeString($_POST['statusflag']);
					$userid = USERID;
					$now = date('Y-m-d H:i:s');
					$supplierclass = new supplier();
					$systemlog = new system_log();


					if($source=='edit'){
						$id = escapeString($_POST['id']);
						$query = "select * from supplier where code='$code' and id!='$id'";
					}
					else{
						$query = "select * from supplier where code='$code'";
					}
					$rs = query($query);

					if(getNumRows($rs)==0){
					
						if($source=='add'){
							$supplierclass->insert(array('',$code,$desc,$suppliergroup,$terms,$fax,$tel,$mobile,$email,$userid,$now,'NULL','NULL',$statusflag));
							$id = $supplierclass->getInsertId();
							$systemlog->logAddedInfo($supplierclass,array($id,$code,$desc,$suppliergroup,$terms,$fax,$tel,$mobile,$email,$userid,$now,'NULL','NULL',$statusflag),'SUPPLIER','New Supplier Added',$userid,$now);
							echo "success";
						}
						else if($source=='edit'){
								$id = escapeString($_POST['id']);
							
								$systemlog->logEditedInfo($supplierclass,$id,array('',$code,$desc,$suppliergroup,$terms,$fax,$tel,$mobile,$email,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag),'SUPPLIER','Edited Supplier Info',$userid,$now);/// log should be before update is made
								$supplierclass->update($id,array($code,$desc,$suppliergroup,$terms,$fax,$tel,$mobile,$email,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag));
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

        	$access = hasAccess(USERID,ACCESSDELETESPPLR);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where supplier.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("select supplier.id,
		        	                supplier.code,
		        	                supplier.description,
		        	                supplier.fax,
		        	                supplier.telephone,
		        	                supplier.mobile,
		        	                supplier.email,
		        	                supplier_group.description as suppliergroup,
		        	                terms.description as terms
		        	         from supplier 
		        	         left join supplier_group on supplier_group.id=supplier_group_id
		        	         left join terms on terms.id=term_id
		        	         $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$code = $obj->code;
		        	$desc = $obj->description;
		        	$fax = $obj->fax;
		        	$telephone = $obj->telephone;
		        	$mobile = $obj->mobile;
		        	$email = $obj->email;
		        	$suppliergroup = $obj->suppliergroup;
		        	$terms = $obj->terms;

		        	$deleters = query("delete from supplier where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('SUPPLIER',"Deleted Supplier","id=$id | code=$code | description=$desc | Supplier Group=$suppliergroup | Terms: $terms | Fax: $fax | Tel: $telephone | Mobile: $mobile | Email: $email",$userid,$now);
		        	}
		        }
		        echo "success";
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }




    if(isset($_POST['supplierGetInfo'])){
		if($_POST['supplierGetInfo']=='kjoI$H2oiaah3h0$09jDppo92po@k@'){
			$id = escapeString($_POST['id']);

			$rs = query("select * 
				 	     from (	
				 	     		 select supplier.id,
			        	                supplier.code,
			        	                supplier.description,
			        	                supplier.fax,
			        	                supplier.telephone,
			        	                supplier.mobile,
			        	                supplier.email,
			        	                supplier_group.description as suppliergroup,
			        	                terms.description as terms,
			        	                supplier.supplier_group_id,
			        	                supplier.term_id,
			        	                supplier.active_flag
			        	         from supplier 
			        	         left join supplier_group on supplier_group.id=supplier_group_id
			        	         left join terms on terms.id=term_id
				 	     	  ) as tbl
					where tbl.id='$id'");

			if(getNumRows($rs)==1){
				while($obj=fetch($rs)){
					$dataarray = array(
										   "id"=>$obj->id,
										   "code"=>utfEncode($obj->code),
										   "description"=>utfEncode($obj->description),
										   "suppliergroupid"=>utfEncode($obj->supplier_group_id),
										   "suppliergroup"=>utfEncode($obj->suppliergroup),
										   "termsid"=>utfEncode($obj->term_id),
										   "terms"=>utfEncode($obj->terms),
										   "fax"=>utfEncode($obj->fax),
										   "telephone"=>utfEncode($obj->telephone),
										   "mobile"=>utfEncode($obj->mobile),
										   "email"=>utfEncode($obj->email),
										   "statusflag"=>utfEncode($obj->active_flag),
										   "response"=>'success'

										  
										   );
				}
				print_r(json_encode($dataarray));
				
			}
			else{
				$dataarray = array(
										  
										   "response"=>'invalidID'

										  
								  );
				
				print_r(json_encode($dataarray));
			}




		


		}
	}

	/**************** ADDRESS ***********************/
	if(isset($_POST['addAddress'])){
        if($_POST['addAddress']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

        	$supplierid = escapeString($_POST['supplierid']);
        	$street = trim($_POST['street'])==''?'NULL':escapeString($_POST['street']);
        	$district = trim($_POST['district'])==''?'NULL':escapeString($_POST['district']);
        	$city = trim($_POST['city'])==''?'NULL':escapeString($_POST['city']);
        	$region = trim($_POST['region'])==''?'NULL':escapeString($_POST['region']);
        	$zipcode = trim($_POST['zipcode'])==''?'NULL':escapeString($_POST['zipcode']);
        	$country = trim($_POST['country'])==''?'NULL':escapeString($_POST['country']);

        	$checkifvalidsupplier = query("select * from supplier where id='$supplierid'");
        	if(getNumRows($checkifvalidsupplier)==1){

        		$addaccess = hasAccess(USERID,ACCESSADDSPPLRADDR);

        		if($addaccess==1){

        			$defaultflag = 1;
        			$checkifhasdefault = query("select * from supplier_address where supplier_id='$supplierid' and default_flag=1");
        			if(getNumRows($checkifhasdefault)>0){
        				$defaultflag = 0;
        			}


        			$userid = USERID;
					$now = date('Y-m-d H:i:s');
        			$supplieraddrclass = new supplier_address();
					$systemlog = new system_log();

					$supplieraddrclass->insert(array('',$supplierid,1,$defaultflag,$street,$district,$city,$region,$zipcode,$country,$userid,$now,'NULL','NULL'));
					$id = $supplieraddrclass->getInsertId();
					$systemlog->logAddedInfo($supplieraddrclass,array($id,$supplierid,1,$defaultflag,$street,$district,$city,$region,$zipcode,$country,$userid,$now,'NULL','NULL'),'SUPPLIER ADDRESS','New Address Added',$userid,$now);
					echo "success";


        		}
        		else{
        			echo "noaddpermission";
        		}


        	}
        	else{
        		echo "invalidsupplier";
        	}


        }
    }



    if(isset($_POST['deleteSelectedAddressRows'])){
        if($_POST['deleteSelectedAddressRows']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$access = hasAccess(USERID,ACCESSDELETESPPLRADDR);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where supplier_address.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("   select supplier_address.id,
							           supplier_address.supplier_id,
							           supplier_address.street,
							           supplier_address.district,
							           supplier_address.city,
							           supplier_address.region,
							           supplier_address.zip_code,
							           supplier_address.country,
							           supplier_address.created_date,
							           concat(cuser.first_name,' ',cuser.last_name) as created_by,
							           supplier_address.updated_date,
							           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
							           case 
									   		when supplier_address.default_flag=1 then 'YES'
									   		else 'NO'
									   end as default_flag,
									   case 
									   		when supplier_address.active_flag=1 then 'YES'
									   		else 'NO'
									   end as active_flag,
									   supplier.description as supplier
							    from supplier_address
							    left join supplier on supplier.id=supplier_address.supplier_id
							    left join user as cuser on cuser.id=supplier_address.created_by
								left join user as uuser on uuser.id=supplier_address.updated_by
		        	            $condition");
		        while($obj=fetch($rs)){
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
					$supplier = utfEncode($obj->supplier);

		        	$deleters = query("delete from supplier_address where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('SUPPLIER ADDRESS',"Deleted Supplier Address","id=$id | Supplier=$supplier | Default Flag=$defaultflag | Active Flag=$activeflag | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
		        	}
		        }
		        echo "success";
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }



    if(isset($_POST['tagAsDefaultAddress'])){
        if($_POST['tagAsDefaultAddress']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        		$systemlog = new system_log();

        		$rs = query("update supplier_address set default_flag=0 where supplier_id='$supplierid'");
	        	
	        	if($rs){
	        		 $rs = query("  select supplier_address.id,
								           supplier_address.supplier_id,
								           supplier_address.street,
								           supplier_address.district,
								           supplier_address.city,
								           supplier_address.region,
								           supplier_address.zip_code,
								           supplier_address.country,
								           supplier_address.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_address.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_address.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_address.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_address
								    left join supplier on supplier.id=supplier_address.supplier_id
								    left join user as cuser on cuser.id=supplier_address.created_by
									left join user as uuser on uuser.id=supplier_address.updated_by
			        	            where supplier_address.id='$id'");
	        		while($obj=fetch($rs)){
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_address 
			        		               set default_flag=1, 
			        		                   active_flag=1,
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER ADDRESS',"Tagged as Default Address","Row ID=$id | Supplier=$supplier | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
			        	}
			        }
			        echo "success";
	        	
	        		
	        	}
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }

    if(isset($_POST['tagAsInactiveAddress'])){
        if($_POST['tagAsInactiveAddress']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();

        		    $rs = query("  select supplier_address.id,
								           supplier_address.supplier_id,
								           supplier_address.street,
								           supplier_address.district,
								           supplier_address.city,
								           supplier_address.region,
								           supplier_address.zip_code,
								           supplier_address.country,
								           supplier_address.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_address.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_address.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_address.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_address
								    left join supplier on supplier.id=supplier_address.supplier_id
								    left join user as cuser on cuser.id=supplier_address.created_by
									left join user as uuser on uuser.id=supplier_address.updated_by
			        	            where supplier_address.id='$id'");
	        		while($obj=fetch($rs)){
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_address 
			        		               set active_flag=0, 
			        		                   default_flag=0, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER ADDRESS',"Tagged as Inactive Address","Row ID=$id | Supplier=$supplier | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
			        	}
			        }
			        echo "success";

        		
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }

    if(isset($_POST['tagAsActiveAddress'])){
        if($_POST['tagAsActiveAddress']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();



        		    $rs = query("  select supplier_address.id,
								           supplier_address.supplier_id,
								           supplier_address.street,
								           supplier_address.district,
								           supplier_address.city,
								           supplier_address.region,
								           supplier_address.zip_code,
								           supplier_address.country,
								           supplier_address.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_address.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_address.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_address.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_address
								    left join supplier on supplier.id=supplier_address.supplier_id
								    left join user as cuser on cuser.id=supplier_address.created_by
									left join user as uuser on uuser.id=supplier_address.updated_by
			        	            where supplier_address.id='$id'");
	        		while($obj=fetch($rs)){
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_address 
			        		               set active_flag=1, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER ADDRESS',"Tagged as Active Address","Row ID=$id | Supplier=$supplier | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
			        	}
			        }
			        echo "success";

        		
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }


    /*************** ADDRESS - END **************************/





    /******************* CONTACT *****************************/
    if(isset($_POST['addContact'])){
        if($_POST['addContact']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

        	$supplierid = escapeString($_POST['supplierid']);
        	$name = trim($_POST['name'])==''?'NULL':escapeString($_POST['name']);
        	$position = trim($_POST['position'])==''?'NULL':escapeString($_POST['position']);
        	$mobile = trim($_POST['mobile'])==''?'NULL':escapeString($_POST['mobile']);
        	$telephone = trim($_POST['telephone'])==''?'NULL':escapeString($_POST['telephone']);
        	$email = trim($_POST['email'])==''?'NULL':escapeString($_POST['email']);

        	$checkifvalidsupplier = query("select * from supplier where id='$supplierid'");
        	if(getNumRows($checkifvalidsupplier)==1){

        		$addaccess = hasAccess(USERID,ACCESSADDSPPLRCNTCT);

        		if($addaccess==1){

        			$defaultflag = 1;
        			$checkifhasdefault = query("select * from supplier_contact where supplier_id='$supplierid' and default_flag=1");
        			if(getNumRows($checkifhasdefault)>0){
        				$defaultflag = 0;
        			}


        			$userid = USERID;
					$now = date('Y-m-d H:i:s');
        			$suppliercontactclass = new supplier_contact();
					$systemlog = new system_log();

					$suppliercontactclass->insert(array('',$supplierid,1,$defaultflag,$name,$position,$mobile,$telephone,$email,$userid,$now,'NULL','NULL'));
					$id = $suppliercontactclass->getInsertId();
					$systemlog->logAddedInfo($suppliercontactclass,array($id,$supplierid,1,$defaultflag,$name,$position,$mobile,$telephone,$email,$userid,$now,'NULL','NULL'),'SUPPLIER CONTACT','New Contact Added',$userid,$now);
					echo "success";


        		}
        		else{
        			echo "noaddpermission";
        		}


        	}
        	else{
        		echo "invalidsupplier";
        	}


        }
    }



    if(isset($_POST['deleteSelectedContactRows'])){
        if($_POST['deleteSelectedContactRows']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$access = hasAccess(USERID,ACCESSDELETESPPLRCNTCT);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where supplier_contact.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("   select supplier_contact.id,
							           supplier_contact.supplier_id,
							           supplier_contact.name,
							           supplier_contact.designation as position,
							           supplier_contact.telephone,
							           supplier_contact.mobile,
							           supplier_contact.email,
							           supplier_contact.street,
							           supplier_contact.district,
							           supplier_contact.city,
							           supplier_contact.region,
							           supplier_contact.zip_code,
							           supplier_contact.country,
							           supplier_contact.created_date,
							           concat(cuser.first_name,' ',cuser.last_name) as created_by,
							           supplier_contact.updated_date,
							           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
							           case 
									   		when supplier_contact.default_flag=1 then 'YES'
									   		else 'NO'
									   end as default_flag,
									   case 
									   		when supplier_contact.active_flag=1 then 'YES'
									   		else 'NO'
									   end as active_flag,
									   supplier.description as supplier
							    from supplier_contact
							    left join supplier on supplier.id=supplier_contact.supplier_id
							    left join user as cuser on cuser.id=supplier_contact.created_by
								left join user as uuser on uuser.id=supplier_contact.updated_by
		        	            $condition");
		        while($obj=fetch($rs)){
		        	$id = $obj->id;
		        	$name = utfEncode($obj->name);
					$position = utfEncode($obj->position);
					$mobile = utfEncode($obj->mobile);
					$tel = utfEncode($obj->telephone);
					$email = utfEncode($obj->email);
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
					$supplier = utfEncode($obj->supplier);

		        	$deleters = query("delete from supplier_contact where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('SUPPLIER CONTACT',"Deleted Supplier Contact","id=$id | Supplier=$supplier | Default Flag=$defaultflag | Active Flag=$activeflag | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
		        	}
		        }
		        echo "success";
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }



    if(isset($_POST['tagAsDefaultContact'])){
        if($_POST['tagAsDefaultContact']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        		$systemlog = new system_log();

        		$rs = query("update supplier_contact set default_flag=0 where supplier_id='$supplierid'");
	        	
	        	if($rs){
	        		 $rs = query("  select supplier_contact.id,
								           supplier_contact.supplier_id,
								           supplier_contact.name,
								           supplier_contact.designation as position,
								           supplier_contact.telephone,
								           supplier_contact.mobile,
								           supplier_contact.email,
								           supplier_contact.street,
								           supplier_contact.district,
								           supplier_contact.city,
								           supplier_contact.region,
								           supplier_contact.zip_code,
								           supplier_contact.country,
								           supplier_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_contact
								    left join supplier on supplier.id=supplier_contact.supplier_id
								    left join user as cuser on cuser.id=supplier_contact.created_by
									left join user as uuser on uuser.id=supplier_contact.updated_by
			        	            where supplier_contact.id='$id'");
	        		while($obj=fetch($rs)){
	        			$name = utfEncode($obj->name);
						$position = utfEncode($obj->position);
						$mobile = utfEncode($obj->mobile);
						$tel = utfEncode($obj->telephone);
						$email = utfEncode($obj->email);
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_contact 
			        		               set default_flag=1, 
			        		                   active_flag=1,
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER CONTACT',"Tagged as Default Contact","Row ID=$id | Supplier=$supplier | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
			        	}
			        }
			        echo "success";
	        	
	        		
	        	}
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }

    if(isset($_POST['tagAsInactiveContact'])){
        if($_POST['tagAsInactiveContact']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();

        		    $rs = query("   select supplier_contact.id,
								           supplier_contact.supplier_id,
								           supplier_contact.name,
								           supplier_contact.designation as position,
								           supplier_contact.telephone,
								           supplier_contact.mobile,
								           supplier_contact.email,
								           supplier_contact.street,
								           supplier_contact.district,
								           supplier_contact.city,
								           supplier_contact.region,
								           supplier_contact.zip_code,
								           supplier_contact.country,
								           supplier_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_contact
								    left join supplier on supplier.id=supplier_contact.supplier_id
								    left join user as cuser on cuser.id=supplier_contact.created_by
									left join user as uuser on uuser.id=supplier_contact.updated_by
			        	            where supplier_contact.id='$id'");
	        		while($obj=fetch($rs)){
	        			$name = utfEncode($obj->name);
						$position = utfEncode($obj->position);
						$mobile = utfEncode($obj->mobile);
						$tel = utfEncode($obj->telephone);
						$email = utfEncode($obj->email);
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_contact 
			        		               set active_flag=0, 
			        		                   default_flag=0, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER CONTACT',"Tagged as Inactive Contact","Row ID=$id | Supplier=$supplier | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
			        	}
			        }
			        echo "success";

        		
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }

    if(isset($_POST['tagAsActiveContact'])){
        if($_POST['tagAsActiveContact']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$id = escapeString($_POST['id']);
        	$supplierid = escapeString($_POST['supplierid']);
        	$access = hasAccess(USERID,ACCESSEDITSPPLRCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();



        		    $rs = query("  select supplier_contact.id,
								           supplier_contact.supplier_id,
								           supplier_contact.name,
								           supplier_contact.designation as position,
								           supplier_contact.telephone,
								           supplier_contact.mobile,
								           supplier_contact.email,
								           supplier_contact.street,
								           supplier_contact.district,
								           supplier_contact.city,
								           supplier_contact.region,
								           supplier_contact.zip_code,
								           supplier_contact.country,
								           supplier_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           supplier_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when supplier_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when supplier_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   supplier.description as supplier
								    from supplier_contact
								    left join supplier on supplier.id=supplier_contact.supplier_id
								    left join user as cuser on cuser.id=supplier_contact.created_by
									left join user as uuser on uuser.id=supplier_contact.updated_by
			        	            where supplier_contact.id='$id'");
	        		while($obj=fetch($rs)){
	        			$name = utfEncode($obj->name);
						$position = utfEncode($obj->position);
						$mobile = utfEncode($obj->mobile);
						$tel = utfEncode($obj->telephone);
						$email = utfEncode($obj->email);
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
						$supplier = utfEncode($obj->supplier);

			        	$updaters = query("update supplier_contact 
			        		               set active_flag=1, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('SUPPLIER CONTACT',"Tagged as Active Contact","Row ID=$id | Supplier=$supplier | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
			        	}
			        }
			        echo "success";

        		
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }



    /******************** CONTACT - END *************************/






?>

