




<?php



$pword = isset($_GET['grantpermission'])?$_GET['grantpermission']:'';



if(md5($pword)=='81c241c698f68d11a57f209c953d85a2'){


	/* STORED PROCEDURE
		DELIMITER $$

		create procedure if not exists deleteTransactionTable()
		BEGIN
			delete from txn_billing;
		    delete from txn_billing_waybill;
		    delete from txn_booking;
		    delete from txn_booking_approval_rejection_history;
		    delete from txn_booking_history;
		    delete from txn_load_plan;
		    delete from txn_load_plan_destination;
		    delete from txn_load_plan_waybill;
		    delete from txn_manifest;
		    delete from txn_manifest_waybill;
		    delete from txn_manifest_waybill_package_code;
		    delete from txn_waybill;
		    delete from txn_waybill_billing_history;
		    delete from txn_waybill_handling_instruction;
		    delete from txn_waybill_movement;
		    delete from txn_waybill_movement_package_code;
		    delete from txn_waybill_movement_waybill;
		    delete from txn_waybill_other_charges;
		    delete from txn_waybill_package_code;
		    delete from txn_waybill_package_dimension;
		    delete from txn_waybill_status_history;
		    delete from txn_waybill_status_history_deleted;
		    delete from txn_waybill_status_history_disregarded;
		END
	*/


	$connection = mysqli_connect("127.0.0.1", "root", "", "wbms-cbl", "8017");
  	$result = mysqli_query($connection,"CALL deleteTransactionTable") or die("Query fail: " . mysqli_error());

  	if($result){
  		echo "Transaction Tables successfully cleared.";
  	}


}
else{
	echo "NO PERMISSION. WARNING: SYSTEM ADMIN USE ONLY";
}



?>