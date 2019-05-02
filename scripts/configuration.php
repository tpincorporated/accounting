 <?php
    include('../config/connection.php');
    include('../config/checklogin.php');
    include('../config/checkurlaccess.php');
    include('../config/functions.php');
    include("../classes/company-information.class.php");
    include("../classes/email-configuration.class.php");
    include("../classes/system-log.class.php");

    if(isset($_POST['emailConfiguration'])){
    	if($_POST['emailConfiguration']=='Bdm2Donoi#20slOPD90&$rpodk49d94po3'){
    		$host = escapeString($_POST['host']);
    		$port = escapeString($_POST['port']);
    		$encryption = escapeString($_POST['encryption']);
    		$uname = escapeString($_POST['username']);
    		$pword = escapeString($_POST['password']);
    		$sender = escapeString($_POST['sender']);
    		$emailfrom = escapeString($_POST['emailfrom']);
            $smtpauthentication = escapeString($_POST['smtpauthentication']);
            $smtpauthentication = $smtpauthentication==1?$smtpauthentication:0;
            $flag = escapeString($_POST['flag']);
            $now = date('Y-m-d H:i:s');

            $emailconf = new email_configuration();
            $systemlog = new System_log();

            $systemlog->logEditedInfo($emailconf,1,array('',$host,$uname,$pword,$port,$emailfrom,$sender,$encryption,$flag,$smtpauthentication),'CONFIGURATION','Edited Email Configuration',$userid,$now);
            $emailconf->update(1,array($host,$uname,$pword,$port,$emailfrom,$sender,$encryption,$flag,$smtpauthentication));
           

            echo "success";

    		/*$query = "update email_configuration set host='$host', username='$uname', password='$pword', port='$port', email_sent_from='$emailfrom', email_sender='$sender', encryption='$encryption' where id='1'";
    		$rs = query($query);
    		if($rs){
    			echo "success";
    		}*/

    	}
    }

    if(isset($_POST['companyInformation'])){
        if($_POST['companyInformation']=='Bdm#r@1podk49d94po3sfr$@1qdsdf'){
            $name = escapeString($_POST['name']);
            $tin = escapeString($_POST['tin']);
            $addr = escapeString($_POST['addr']);
            $city = escapeString($_POST['city']);
            $state = escapeString($_POST['state']);
            $postal = escapeString($_POST['postal']);
            $country = escapeString($_POST['country']);
            $primary = escapeString($_POST['primary']);
            $secondary = escapeString($_POST['secondary']);
            $now = date('Y-m-d H:i:s');

            $companyinfo = new company_information();
            $systemlog = new System_log();

            $systemlog->logEditedInfo($companyinfo,1,array('',$name,$addr,$city,$state,$country,$postal,$primary,$secondary,$tin),'CONFIGURATION','Edited Company Information',$userid,$now);
            $companyinfo->update(1,array($name,$addr,$city,$state,$country,$postal,$primary,$secondary,$tin));
           

            echo "success";

        }
    }

    if(isset($_POST['getEmailNotificationDetails'])){
        if($_POST['getEmailNotificationDetails']=='Bdm#r@1podk49d94po3sfr$@1qdsdf'){


            $rs = query("select * from email_configuration where id='1'");

            if(getNumRows($rs)==1){
                while($obj=fetch($rs)){
                   
                    $activeflag = $obj->active_flag=='1'?'checked':'';
                    $dataarray = array(
                                           "host"=>utfEncode($obj->host),
                                           "username"=>utfEncode($obj->username),
                                           "password"=>utfEncode($obj->password),
                                           "port"=>utfEncode($obj->port),
                                           "from"=>utfEncode($obj->email_sent_from),
                                           "sender"=>utfEncode($obj->email_sender),
                                           "encryption"=>utfEncode($obj->encryption),
                                           "activeflag"=>$activeflag,
                                           "smtpauthenticationflag"=>utfEncode($obj->smtp_authentication_flag),
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


    if(isset($_POST['getCompanyDetails'])){
        if($_POST['getCompanyDetails']=='Bdm#r@1podk49d94po3sfr$@1qdsdf'){


            $rs = query("select * from company_information where id='1'");

            if(getNumRows($rs)==1){
                while($obj=fetch($rs)){
                   


                    $dataarray = array(
                                           "companyname"=>utfEncode($obj->company_name),
                                           "companytin"=>utfEncode($obj->tax_identification_number),
                                           "companyaddress"=>utfEncode($obj->company_address),
                                           "city"=>utfEncode($obj->city),
                                           "stateprovince"=>utfEncode($obj->state_province),
                                           "postalcode"=>utfEncode($obj->postal_code),
                                           "country"=>utfEncode($obj->country),
                                           "primarycolor"=>utfEncode($obj->primary_color),
                                           "secondarycolor"=>utfEncode($obj->secondary_color),
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

  






?>