<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		Default Accounts
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='defaultaccountstable'>
			<tbody></tbody>

		</table>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){

		var tabDFLTACCOUNTS = "#defaultaccounts-menutabpane";

		

		$(tabDFLTACCOUNTS+" #defaultaccountstable").flexigrid({
				url: 'loadables/ajax/general-ledger.default-accounts.php',
				dataType: 'json',
				colModel : [
						{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'Description', name : 'description', width : 350, sortable : true, align: 'left'},
						{display: 'Account No.', name : 'accountnumber', width : 200, sortable : true, align: 'left'},
						{display: 'Account Name', name : 'accountname', width : 400, sortable : true, align: 'left'}
				],
				buttons : [
						/*{name: 'Add', bclass: 'add addcarrierbtn', onpress : ''},
						{separator: true},
						{name: 'Delete', bclass: 'delete addcarrierbtn', onpress : ''}*/
						/*{separator: true},
						{name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
				],
				searchitems : [
						{display: 'Account No.', name : 'accountnumber', isdefault: true},
						{display: 'Account Name', name : 'accountname'},
						{display: 'Description', name : 'description'}
				],
				sortname: "description",
				sortorder: "asc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 15, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 500,
				singleSelect: false
		});

	
		

		
		userAccess();
			

		
	});
	
</script>