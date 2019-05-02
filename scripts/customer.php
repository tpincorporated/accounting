<?php
	include("../config/connection.php");
    include("../config/checkurlaccess.php");
    include("../config/checklogin.php");
    include("../config/functions.php");
    include("../classes/customer.class.php");
    include("../classes/customer-address.class.php");
    include("../classes/customer-contact.class.php");
    include("../classes/system-log.class.php");////////

	if(isset($_POST['customerSaveEdit'])){
		if($_POST['customerSaveEdit']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

			$editaccess = hasAccess(USERID,ACCESSEDITCLIENT);
			$addaccess = hasAccess(USERID,ACCESSADDCLIENT);

			$source = escapeString($_POST['source']);

			if(($editaccess==1&&$source=='edit')||($addaccess==1&&$source=='add')){

					$code = escapeString(strtoupper(trim($_POST['code'])));
					$desc = escapeString(strtoupper($_POST['desc']));
					$fax = escapeString(strtoupper($_POST['fax']));
					$tel = escapeString(strtoupper($_POST['tel']));
					$mobile = escapeString(strtoupper($_POST['mobile']));
					$email = escapeString(strtoupper($_POST['email']));
					$customergroup = escapeString(strtoupper($_POST['customergroup']));
					$terms = escapeString(strtoupper($_POST['terms']));
					$statusflag = escapeString($_POST['statusflag']);
					$userid = USERID;
					$now = date('Y-m-d H:i:s');
					$customerclass = new client();
					$systemlog = new system_log();


					if($source=='edit'){
						$id = escapeString($_POST['id']);
						$query = "select * from client where code='$code' and id!='$id'";
					}
					else{
						$query = "select * from client where code='$code'";
					}
					$rs = query($query);

					if(getNumRows($rs)==0){
					
						if($source=='add'){
							$customerclass->insert(array('',$code,$desc,$customergroup,$terms,$fax,$tel,$mobile,$email,$userid,$now,'NULL','NULL',$statusflag));
							$id = $customerclass->getInsertId();
							$systemlog->logAddedInfo($customerclass,array($id,$code,$desc,$customergroup,$terms,$fax,$tel,$mobile,$email,$userid,$now,'NULL','NULL',$statusflag),'CUSTOMER','New customer Added',$userid,$now);
							echo "success";
						}
						else if($source=='edit'){
								$id = escapeString($_POST['id']);
							
								$systemlog->logEditedInfo($customerclass,$id,array('',$code,$desc,$customergroup,$terms,$fax,$tel,$mobile,$email,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag),'CUSTOMER','Edited customer Info',$userid,$now);/// log should be before update is made
								$customerclass->update($id,array($code,$desc,$customergroup,$terms,$fax,$tel,$mobile,$email,'NOCHANGE','NOCHANGE',$userid,$now,$statusflag));
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

        	$access = hasAccess(USERID,ACCESSDELETECLIENT);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where client.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("select client.id,
		        	                client.code,
		        	                client.description,
		        	                client.fax,
		        	                client.telephone,
		        	                client.mobile,
		        	                client.email,
		        	                client_group.description as clientgroup,
		        	                terms.description as terms
		        	         from client 
		        	         left join client_group on client_group.id=client_group_id
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
		        	$clientgroup = $obj->clientgroup;
		        	$terms = $obj->terms;

		        	$deleters = query("delete from client where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('CUSTOMER',"Deleted Customer","id=$id | code=$code | description=$desc | Customer Group=$clientgroup | Terms: $terms | Fax: $fax | Tel: $telephone | Mobile: $mobile | Email: $email",$userid,$now);
		        	}
		        }
		        echo "success";
		    }
		    else{
		    	echo "nodeletepermission";
		    }
       	}
    }




    if(isset($_POST['customerGetInfo'])){
		if($_POST['customerGetInfo']=='kjoI$H2oiaah3h0$09jDppo92po@k@'){
			$id = escapeString($_POST['id']);

			$rs = query("select * 
				 	     from (	
				 	     		 select client.id,
			        	                client.code,
			        	                client.description,
			        	                client.fax,
			        	                client.telephone,
			        	                client.mobile,
			        	                client.email,
			        	                client_group.description as clientgroup,
			        	                terms.description as terms,
			        	                client.client_group_id,
			        	                client.term_id,
			        	                client.active_flag
			        	         from client 
			        	         left join client_group on client_group.id=client_group_id
			        	         left join terms on terms.id=term_id
				 	     	  ) as tbl
					where tbl.id='$id'");

			if(getNumRows($rs)==1){
				while($obj=fetch($rs)){
					$dataarray = array(
										   "id"=>$obj->id,
										   "code"=>utfEncode($obj->code),
										   "description"=>utfEncode($obj->description),
										   "customergroupid"=>utfEncode($obj->client_group_id),
										   "customergroup"=>utfEncode($obj->clientgroup),
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





	if(isset($_POST['addAddress'])){
        if($_POST['addAddress']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

        	$customerid = escapeString($_POST['customerid']);
        	$street = trim($_POST['street'])==''?'NULL':escapeString($_POST['street']);
        	$district = trim($_POST['district'])==''?'NULL':escapeString($_POST['district']);
        	$city = trim($_POST['city'])==''?'NULL':escapeString($_POST['city']);
        	$region = trim($_POST['region'])==''?'NULL':escapeString($_POST['region']);
        	$zipcode = trim($_POST['zipcode'])==''?'NULL':escapeString($_POST['zipcode']);
        	$country = trim($_POST['country'])==''?'NULL':escapeString($_POST['country']);

        	$checkifvalidcustomer = query("select * from client where id='$customerid'");
        	if(getNumRows($checkifvalidcustomer)==1){

        		$addaccess = hasAccess(USERID,ACCESSADDCLIENTADDR);

        		if($addaccess==1){

        			$defaultflag = 1;
        			$checkifhasdefault = query("select * from client_address where client_id='$customerid' and default_flag=1");
        			if(getNumRows($checkifhasdefault)>0){
        				$defaultflag = 0;
        			}


        			$userid = USERID;
					$now = date('Y-m-d H:i:s');
        			$clientaddrclass = new client_address();
					$systemlog = new system_log();

					$clientaddrclass->insert(array('',$customerid,1,$defaultflag,$street,$district,$city,$region,$zipcode,$country,$userid,$now,'NULL','NULL'));
					$id = $clientaddrclass->getInsertId();
					$systemlog->logAddedInfo($clientaddrclass,array($id,$customerid,1,$defaultflag,$street,$district,$city,$region,$zipcode,$country,$userid,$now,'NULL','NULL'),'CUSTOMER ADDRESS','New Address Added',$userid,$now);
					echo "success";


        		}
        		else{
        			echo "noaddpermission";
        		}


        	}
        	else{
        		echo "invalidcustomer";
        	}


        }
    }



    if(isset($_POST['deleteSelectedAddressRows'])){
        if($_POST['deleteSelectedAddressRows']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$access = hasAccess(USERID,ACCESSDELETECLIENTADDR);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where client_address.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("   select client_address.id,
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
									   end as active_flag,
									   client.description as client
							    from client_address
							    left join client on client.id=client_address.client_id
							    left join user as cuser on cuser.id=client_address.created_by
								left join user as uuser on uuser.id=client_address.updated_by
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
					$client = utfEncode($obj->client);

		        	$deleters = query("delete from client_address where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('CUSTOMER ADDRESS',"Deleted Customer Address","id=$id | Customer=$client | Default Flag=$defaultflag | Active Flag=$activeflag | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        		$systemlog = new system_log();

        		$rs = query("update client_address set default_flag=0 where client_id='$customerid'");
	        	
	        	if($rs){
	        		 $rs = query("  select client_address.id,
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
										   end as active_flag,
										   client.description as client
								    from client_address
								    left join client on client.id=client_address.client_id
								    left join user as cuser on cuser.id=client_address.created_by
									left join user as uuser on uuser.id=client_address.updated_by
			        	            where client_address.id='$id'");
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
						$client = utfEncode($obj->client);

			        	$updaters = query("update client_address 
			        		               set default_flag=1, 
			        		                   active_flag=1,
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER ADDRESS',"Tagged as Default Address","Row ID=$id | Customer=$client | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();

        		    $rs = query("  select client_address.id,
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
										   end as active_flag,
										   client.description as client
								    from client_address
								    left join client on client.id=client_address.client_id
								    left join user as cuser on cuser.id=client_address.created_by
									left join user as uuser on uuser.id=client_address.updated_by
			        	            where client_address.id='$id'");
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
						$client = utfEncode($obj->client);

			        	$updaters = query("update client_address 
			        		               set active_flag=0, 
			        		                   default_flag=0, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER ADDRESS',"Tagged as Inactive Address","Row ID=$id | Customer=$client | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTADDR);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();



        		    $rs = query("  select client_address.id,
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
										   end as active_flag,
										   client.description as client
								    from client_address
								    left join client on client.id=client_address.client_id
								    left join user as cuser on cuser.id=client_address.created_by
									left join user as uuser on uuser.id=client_address.updated_by
			        	            where client_address.id='$id'");
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
						$client = utfEncode($obj->client);

			        	$updaters = query("update client_address 
			        		               set active_flag=1, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER ADDRESS',"Tagged as Active Address","Row ID=$id | Customer=$client | Street: $street | District: $district | City: $city | Region: $region | Zip Code: $zip | Country: $country",$userid,$now);
			        		
			        	}
			        }
			        echo "success";

        		
	        }
	        else{
	        	echo "nopermission";
	        }

        }
    }


     /******************* CONTACT *****************************/
    if(isset($_POST['addContact'])){
        if($_POST['addContact']=='j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@'){

        	$customerid = escapeString($_POST['customerid']);
        	$name = trim($_POST['name'])==''?'NULL':escapeString($_POST['name']);
        	$position = trim($_POST['position'])==''?'NULL':escapeString($_POST['position']);
        	$mobile = trim($_POST['mobile'])==''?'NULL':escapeString($_POST['mobile']);
        	$telephone = trim($_POST['telephone'])==''?'NULL':escapeString($_POST['telephone']);
        	$email = trim($_POST['email'])==''?'NULL':escapeString($_POST['email']);

        	$checkifvalidcustomer = query("select * from client where id='$customerid'");
        	if(getNumRows($checkifvalidcustomer)==1){

        		$addaccess = hasAccess(USERID,ACCESSADDCLIENTCNTCT);

        		if($addaccess==1){

        			$defaultflag = 1;
        			$checkifhasdefault = query("select * from client_contact where client_id='$customerid' and default_flag=1");
        			if(getNumRows($checkifhasdefault)>0){
        				$defaultflag = 0;
        			}


        			$userid = USERID;
					$now = date('Y-m-d H:i:s');
        			$customercontactclass = new client_contact();
					$systemlog = new system_log();

					$customercontactclass->insert(array('',$customerid,1,$defaultflag,$name,$position,$mobile,$telephone,$email,$userid,$now,'NULL','NULL'));
					$id = $customercontactclass->getInsertId();
					$systemlog->logAddedInfo($customercontactclass,array($id,$customerid,1,$defaultflag,$name,$position,$mobile,$telephone,$email,$userid,$now,'NULL','NULL'),'CUSTOMER CONTACT','New Contact Added',$userid,$now);
					echo "success";


        		}
        		else{
        			echo "noaddpermission";
        		}


        	}
        	else{
        		echo "invalidcustomer";
        	}


        }
    }



    if(isset($_POST['deleteSelectedContactRows'])){
        if($_POST['deleteSelectedContactRows']=='skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs'){

        	$access = hasAccess(USERID,ACCESSDELETECLIENTCNTCT);

        	if($access==1){
	        	@$data = $_POST['data'];
		        $itemsiterate = count($data);
		        $systemlog = new system_log();
		        $userid = USERID;
		        $now = date('Y-m-d H:i:s');

		        $condition = "";
		        if($itemsiterate>0){
		        	$condition = "where client_contact.id in ('".implode("','", $data)."')";
		        }

		        $rs = query("   select client_contact.id,
							           client_contact.client_id,
							           client_contact.name,
							           client_contact.designation as position,
							           client_contact.telephone,
							           client_contact.mobile,
							           client_contact.email,
							           client_contact.street,
							           client_contact.district,
							           client_contact.city,
							           client_contact.region,
							           client_contact.zip_code,
							           client_contact.country,
							           client_contact.created_date,
							           concat(cuser.first_name,' ',cuser.last_name) as created_by,
							           client_contact.updated_date,
							           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
							           case 
									   		when client_contact.default_flag=1 then 'YES'
									   		else 'NO'
									   end as default_flag,
									   case 
									   		when client_contact.active_flag=1 then 'YES'
									   		else 'NO'
									   end as active_flag,
									   client.description as client
							    from client_contact
							    left join client on client.id=client_contact.client_id
							    left join user as cuser on cuser.id=client_contact.created_by
								left join user as uuser on uuser.id=client_contact.updated_by
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
					$customer = utfEncode($obj->client);

		        	$deleters = query("delete from client_contact where id='$id'");
		        	if(!$deleters){
		        		echo "ID: $id -".mysql_error()."\n";
		        	}
		        	else{
		        		$systemlog->logInfo('CUSTOMER CONTACT',"Deleted Customer Contact","id=$id | Customer=$customer | Default Flag=$defaultflag | Active Flag=$activeflag | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        		$systemlog = new system_log();

        		$rs = query("update client_contact set default_flag=0 where client_id='$customerid'");
	        	
	        	if($rs){
	        		 $rs = query("  select client_contact.id,
								           client_contact.client_id,
								           client_contact.name,
								           client_contact.designation as position,
								           client_contact.telephone,
								           client_contact.mobile,
								           client_contact.email,
								           client_contact.street,
								           client_contact.district,
								           client_contact.city,
								           client_contact.region,
								           client_contact.zip_code,
								           client_contact.country,
								           client_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           client_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when client_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when client_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   client.description as client
								    from client_contact
								    left join client on client.id=client_contact.client_id
								    left join user as cuser on cuser.id=client_contact.created_by
									left join user as uuser on uuser.id=client_contact.updated_by
			        	            where client_contact.id='$id'");
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
						$customer = utfEncode($obj->client);

			        	$updaters = query("update client_contact 
			        		               set default_flag=1, 
			        		                   active_flag=1,
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER CONTACT',"Tagged as Default Contact","Row ID=$id | Customer=$customer | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();

        		    $rs = query("   select client_contact.id,
								           client_contact.client_id,
								           client_contact.name,
								           client_contact.designation as position,
								           client_contact.telephone,
								           client_contact.mobile,
								           client_contact.email,
								           client_contact.street,
								           client_contact.district,
								           client_contact.city,
								           client_contact.region,
								           client_contact.zip_code,
								           client_contact.country,
								           client_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           client_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when client_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when client_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   client.description as client
								    from client_contact
								    left join client on client.id=client_contact.client_id
								    left join user as cuser on cuser.id=client_contact.created_by
									left join user as uuser on uuser.id=client_contact.updated_by
			        	            where client_contact.id='$id'");
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
						$customer = utfEncode($obj->client);

			        	$updaters = query("update client_contact 
			        		               set active_flag=0, 
			        		                   default_flag=0, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER CONTACT',"Tagged as Inactive Contact","Row ID=$id | Customer=$customer | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
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
        	$customerid = escapeString($_POST['customerid']);
        	$access = hasAccess(USERID,ACCESSEDITCLIENTCNTCT);
        	$now = date('Y-m-d H:i:s');
        	$userid = USERID;

        	if($access==1){
        			$systemlog = new system_log();



        		    $rs = query("  select client_contact.id,
								           client_contact.client_id,
								           client_contact.name,
								           client_contact.designation as position,
								           client_contact.telephone,
								           client_contact.mobile,
								           client_contact.email,
								           client_contact.street,
								           client_contact.district,
								           client_contact.city,
								           client_contact.region,
								           client_contact.zip_code,
								           client_contact.country,
								           client_contact.created_date,
								           concat(cuser.first_name,' ',cuser.last_name) as created_by,
								           client_contact.updated_date,
								           concat(uuser.first_name,' ',uuser.last_name) as updated_by,
								           case 
										   		when client_contact.default_flag=1 then 'YES'
										   		else 'NO'
										   end as default_flag,
										   case 
										   		when client_contact.active_flag=1 then 'YES'
										   		else 'NO'
										   end as active_flag,
										   client.description as client
								    from client_contact
								    left join client on client.id=client_contact.client_id
								    left join user as cuser on cuser.id=client_contact.created_by
									left join user as uuser on uuser.id=client_contact.updated_by
			        	            where client_contact.id='$id'");
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
						$customer = utfEncode($obj->client);

			        	$updaters = query("update client_contact 
			        		               set active_flag=1, 
			        		                   updated_date='$now', 
			        		                   updated_by='$userid' 
			        		               where id='$id'");
			        	if($updaters){
			        		$systemlog->logInfo('CUSTOMER CONTACT',"Tagged as Active Contact","Row ID=$id | Customer=$customer | Name: $name | Position: $position | Mobile: $mobile | Telephone: $tel | Email: $email",$userid,$now);
			        		
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

