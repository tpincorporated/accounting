<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		Chart of Accounts
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='chartofaccountstable'>
			<tbody></tbody>

		</table>

		<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
		<div class="panel-group classictheme margin-bottom-xs" id="chartofaccounts-paneldetails-wrapper" role="tablist" aria-multiselectable="true">

				<div class="panel panel-default">
					<div class="panel-heading" role="tab" data-toggle="collapse" href="#chartofaccounts-paneldetails">
						Details
					</div>
					<div id="chartofaccounts-paneldetails" class="panel-collapse collapse in" role="tabpanel">
						<div class="panel-body">
							<div class='row'>
								<div class="col-md-12">
									<div class="details-errordiv"></div>
								</div>
							</div>
							<div class="form-horizontal">
								<div class="col-md-6">
									<div class="form-group">
										<label class='control-label col-lg-3'>Account Number</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-accountnumber'>
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Account Name</label>
										<div class="col-lg-9">
											<textarea class='form-control chartofaccounts-accountname' rows='3'></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Type</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-type'>
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Header Account</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-headeraccount'>
										</div>
									</div>




								</div>
								<div class='col-md-6'>
									<div class="form-group">
										<label class='control-label col-lg-3'>Debit Amount</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-debitamount alwaysdisabled' disabled="true">
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Credit Amount</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-creditamount alwaysdisabled' disabled="true">
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Total</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-total alwaysdisabled' disabled="true">
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'></label>
										<div class="col-lg-9">
												
													<input type='checkbox' class='chartofaccounts-updateamounts' > <span class='' style='font-size: 12px; font-weight: 600'>&nbsp;Update Amounts</span>
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Updated Date</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-updateddate alwaysdisabled' disabled="true">
										</div>
									</div>
									<div class="form-group">
										<label class='control-label col-lg-3'>Updated by</label>
										<div class="col-lg-9">
											<input type='text' class='form-control chartofaccounts-updatedby alwaysdisabled' disabled="true">
										</div>
									</div>




								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){

		var tabCHARTOFACC = "#chartofaccounts-menutabpane";

		

		$(tabCHARTOFACC+" #chartofaccountstable").flexigrid({
				url: 'loadables/ajax/general-ledger.chart-of-accounts.php',
				dataType: 'json',
				colModel : [
						{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'Account #', name : 'accountnumber', width : 150, sortable : true, align: 'left'},
						{display: 'Account Name', name : 'accountname', width : 350, sortable : true, align: 'left'},
						{display: 'Type', name : 'type', width : 150, sortable : true, align: 'left'},
						{display: 'Header Account', name : 'headeraccount', width : 200, sortable : true, align: 'left'},
						{display: 'Total', name : 'total', width : 200, sortable : true, align: 'right'}
				],
				buttons : [
						{name: 'Add', bclass: 'add addcarrierbtn', onpress : ''},
						{separator: true},
						{name: 'Delete', bclass: 'delete addcarrierbtn', onpress : ''}
						/*{separator: true},
						{name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
				],
				searchitems : [
						{display: 'Account No.', name : 'accountnumber', isdefault: true},
						{display: 'Account Name', name : 'accountname'},
						{display: 'Type', name : 'type'},
						{display: 'Header Account', name : 'headeraccount'}
				],
				sortname: "accountnumber",
				sortorder: "asc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 15, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 350,
				singleSelect: false
		});

	
		

		
		userAccess();
			

		
	});
	
</script>