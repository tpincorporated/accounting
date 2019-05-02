<?php
    include("db-function.php");
    include("permission-definitions.php");


    function updateWaybillStatusBasedOnHistory($waybill){

        $rs = query("select * from txn_waybill_status_history where waybill_number='$waybill' order by created_date desc limit 1");

        if(getNumRows($rs)>0){
            
        }

    }

    function usedAsForeignKey($dbname,$tablename,$columnname,$val){
        $flag = 1;
        $rs = query("
                            call checkIfUsedAsForeignKey('".$dbname."','".$tablename."','".$columnname."',".$val.");


                    ");
        while($obj=fetch($rs)){
            $flag = $obj->flagresult;
        }
       
        //echo $flag;
        return $flag;
    }

    function getEmailAddressesTO($module,$locid,$agentid){
        $response = array();

        $condition = '';
        if($module=='MFLOAD'){
            $condition = " and (location_id='$locid' or agent_id='$agentid') ";
        }

        
        $rs = query("select * from email_address where module='$module' and type='TO' $condition");
        if(getNumRows($rs)==0){
             $rs = query("select * from email_address where module='$module' $condition limit 1");
        }
        while($obj=fetch($rs)){
            array_push($response, $obj->email);
        }
        return $response;
    }

    function getEmailAddressesCC($module,$locid,$agentid){
        $response = array();

        $condition = '';
        if($module=='MFLOAD'){
            $condition = " and (location_id='$locid' or agent_id='$agentid') ";
        }


        $rs = query("select * from email_address where module='$module' and type='CC' $condition");
        while($obj=fetch($rs)){
            array_push($response, $obj->email);
        }
        return $response;
    }

    function getLoadPlanDestination($ldpnumber){
        $destination = '';
        $rs = query("select group_concat(origin_destination_port.description order by origin_destination_port.description asc separator ', ') as destination
                     from txn_load_plan_destination 
                     left join origin_destination_port on origin_destination_port.id=txn_load_plan_destination.origin_destination_port_id
                     where txn_load_plan_destination.load_plan_number='$ldpnumber'
                     group by txn_load_plan_destination.load_plan_number 
                     ");
        while($obj=fetch($rs)){
            $destination = $obj->destination;
        }
        return $destination;
    }

    function Str4CSV($str){
        if(ContainsComma($str)){
            return "\"".$str."\"";
        }
        return $str;
    }

    function utfEncode($str){
        return utf8_encode($str);
    }

     function utfDecode($str){
        return utf8_decode($str);
    }

    function concatAddress($array){
        $temp = array();
        $len = count($array);
        $data = '';

        for($i=0;$i<$len;$i++){
            $wd = trim($array[$i]);
            if($wd!=''){
                array_push($temp, strtoupper($wd));
            }

        }
        $data = implode(', ', $temp);
        return $data;
    }

    


    function loadplanHasManifest($loadplannumber){
        $response = 1;

        $rs = query("select * from txn_manifest where load_plan_number='$loadplannumber' and status!='VOID'");

        if(getNumRows($rs)==0){
            $response = 0;
        }

        return $response;
    }

    
    function getUserOtherLocations($userid){
        $arr = array();
        $rs = query("select warehouse_id, 
                            warehouse.description as locname 
                            from user_warehouse
                            left join warehouse on warehouse.id=user_warehouse.warehouse_id 
                            where user_id='$userid'");
        while($obj=fetch($rs)){
            array_push($arr, $obj->warehouse_id.'%$&'.utfEncode($obj->locname));
        }
        $str = implode('#@$', $arr);
        return $str;
    }

    function getLoadPlanDestinations($ldpnumber){
        $arr = array();
        $rs = query("select origin_destination_port_id, 
                            origin_destination_port.description as destination 
                    from txn_load_plan_destination 
                    left join origin_destination_port on origin_destination_port.id=txn_load_plan_destination.origin_destination_port_id
                    where load_plan_number='$ldpnumber'");
        while($obj=fetch($rs)){
            array_push($arr, $obj->origin_destination_port_id.'%$&'.utfEncode($obj->destination));
        }
        $str = implode('#@$', $arr);
        return $str;
    }

    function getWaybillHandlingInstructions($waybill){
        $arr = array();
        $rs = query("select handling_instruction_id, 
                            handling_instruction.description 
                     from txn_waybill_handling_instruction 
                     left join handling_instruction on handling_instruction.id=txn_waybill_handling_instruction.handling_instruction_id
                     where waybill_number='$waybill'");
        while($obj=fetch($rs)){
            array_push($arr, $obj->handling_instruction_id.'%$&'.utfEncode($obj->description));
        }
        $str = implode('#@$', $arr);
        return $str;
    }
    
    function ContainsComma($str){
        foreach(str_split($str) as $s){
            if($s==","){
                return true;
            }
        }
        return false;
    }
   
    function getColor($colorcol){
        $color = getInfo('company_information',$colorcol,"where id=1");
        $color = str_replace('rgb', '', $color);
        $color = str_replace(')', '', $color);
        $color = str_replace('(', '', $color);
        $color = explode(',', $color);
        return $color;
    }

    function validateDate($date){
        $d = DateTime::createFromFormat('Y-m-d', $date);
        return $d && $d->format('Y-m-d') === $date;
    }

    function validateDateTime($date){
        $d = DateTime::createFromFormat('Y-m-d H:i:s', $date);
        return $d && $d->format('Y-m-d H:i:s') === $date;
    }

    function hasAccess($userid,$menuid){
        $response = 1;
        $rs = query("select * from user_rights where user_id='$userid' and menu_id='$menuid'");//if exist, user not allowed.
        if(getNumRows($rs)>0){
            $response = 0;
        }
        return $response;
    }

    

    function flcapital($str){
        $str = ucwords(strtolower($str));
        return $str;
    }
   

   

    function getNameOfUser($id){//GET NAME OF USER ID
        $fn='';
        $mn='';
        $ln='';
        $r = query("select * from user where id='$id' and active_flag=1");
        while($obj=fetch($r)){
            $fn=utfEncode($obj->first_name);
            $mn=utfEncode($obj->middle_name);
            $ln=utfEncode($obj->last_name);
        }
        return $fn.' '.$mn.' '.$ln;
    }

    function checkIfExist($tablename,$condition){
        $query = "select * from ".$tablename." ".$condition;
        $rs=query($query);
        $count = getNumRows($rs);
        if($count>=1){
            return true;
        }
        else{
           return false;
        }
    }


    function randomPassword() {
        $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789@!";
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 10; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    

    function userAccess($user,$menuid){
        $query = "select * from user_rights where user_id='$user' and menu_id='$menuid'";
        $rs = query($query);
        if(getNumRows($rs)>=1){
            return true;
        }
        else{
            return false;
        }
    }
    function getInfo($table,$column,$condition){
        $ret = '';
        $rs = query("select * from ".$table." ".$condition);
        while($obj=fetch($rs)){
            $ret = $obj->$column;
        }
        return $ret;
    }
    function trimString($str){
        $newstr =  str_replace("'", '', $str);
        $newstr =  str_replace('"', '', $newstr);
        return $newstr;
    }

    function dateFormat($date,$format){
        if($date=="0000-00-00 00:00:00"||$date==''||$date=='0000-00-00'){
            $date ='';
        }
        else{
           $date = date($format, strtotime($date));
        }
        return $date;
    }
   
     function formatDate($date){
        if($date=="0000-00-00 00:00:00"||$date==''||$date=='0000-00-00'){
            $date ='';
        }
        else{
           $date = date('M d, Y h:i:s A', strtotime($date));
        }
        return $date;
    }

    function convertWithDecimal($number,$decimalplaces){
        $temp = number_format($number,$decimalplaces,'.',',');

        if($number!=0){
                $num = number_format($number,$decimalplaces,'.',',');
                $num = trim($num,'0');
                if(substr($num, -1)=='.'){
                    $num = $num.'00';
                }
                else if(substr($num, -2,1)=='.'){
                    $num = $num.'0';
                }

                if(substr($num, 0,1)==='.'){
                    $num = '0'.$num;
                }
            
        }
        else{
            $num = number_format($number,$decimalplaces,'.',',');
        }

        if(strpos($temp, '.')===false){
            $num =  number_format($number,$decimalplaces,'.',',');
        }

        if($num==0){
            $num = 0;
        }
        return $num;
    }

    function convertWithDecimal2($number,$decimalplaces){
        $temp = number_format($number,$decimalplaces,'.','');

        if($number!=0){
                $num = number_format($number,$decimalplaces,'.','');
                $num = trim($num,'0');
                if(substr($num, -1)=='.'){
                    $num = $num.'00';
                }
                else if(substr($num, -2,1)=='.'){
                    $num = $num.'0';
                }

                if(substr($num, 0,1)==='.'){
                    $num = '0'.$num;
                }
            
        }
        else{
            $num = number_format($number,$decimalplaces,'.','');
        }

        if(strpos($temp, '.')===false){
            $num =  number_format($number,$decimalplaces,'.','');
        }

        if($num==0){
            $num = 0;
        }
        return $num;
    }
    
	

    function lineBreak($string, $maxwidth){
        $string = trim($string);
        if(strlen($string)<$maxwidth){
            $substr = $string;
        }
        else{
            $substr = preg_replace("/\s+?(\S+)?$/", '', substr($string, 0, $maxwidth));
        }
        return $substr;
        
    }


    function getNextTransactionNumber($transactiontypeId){
        $query = "select * from transaction_type where id='$transactiontypeId'";
        $rs = query($query);
        while($obj=fetch($rs)){
            $prefix = $obj->prefix;
            $nextnum = $obj->next_number_series;
        }
       
            if(trim($prefix)==''||$prefix==NULL){
                 $number = $prefix.str_pad($nextnum, 8,'0',STR_PAD_LEFT);
            }
            else{
                $number = $prefix.str_pad($nextnum, 8,'0',STR_PAD_LEFT);
            }
        
        $number = trim($number);
        return $number;
    }

  

    function getTransactionNumber($transactiontypeId){
        $flag = 1;
        $temp = 0;
        while($flag==1){
          $query = "select * from transaction_type where id='$transactiontypeId'";
          $rs = query($query);
          while($obj=fetch($rs)){
              $prefix = $obj->prefix;
              $nextnum = $obj->next_number_series;
          }
          $number = $prefix.str_pad($nextnum, 8,'0',STR_PAD_LEFT);
          $insertrs = mysql_query("insert into transaction_numbers_used(transaction_number) values('$number')");

          if($insertrs){
              $flag = 0;
              query("update transaction_type set next_number_series = next_number_series + 1 where id='$transactiontypeId'");
          }
          else{
              if($temp>1){
                  query("update transaction_type set next_number_series = next_number_series + 1 where id='$transactiontypeId'");
              }
          }
          $temp++;
        }

        return $number;
    }

    


  

    function getUserName($id){//GET NAME OF USER ID
        $fn='';
        $mn='';
        $ln='';
        $r = query("select * from user where id='$id'");
        while($obj=fetch($r)){
            $fn=utfEncode($obj->first_name);
            $mn=utfEncode($obj->middle_name);
            $ln=utfEncode($obj->last_name);
        }
        return $fn.' '.$mn.' '.$ln;
    }


    function getUserAssignedLocations($userid){
        $arr = array();
        $rs = query("select * from user_warehouse where user_id='$userid'");
        while($obj=fetch($rs)){
            array_push($arr, $obj->warehouse_id);
        }
        $str = implode("','", $arr);
        return "('".$str."')";
    }

   



?>