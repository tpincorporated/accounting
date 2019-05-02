<?php
     include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
    $refCHECKDISB = isset($_GET['reference'])?escapeString($_GET['reference']):'';
?>
<div class='header-page' >
	<div class='header-page-inner'>
		Check Disbursement
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
                <!-- CONTENT -->
                <div class='transaction-wrapper checkdisbursement-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='checkdisbursement-trans-newbtn' data-toggle='modal' href='#newcheckdisbursementmodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='checkdisbursement-inputfields'>
                                				<input type='hidden' id='pgtxncheckdisbursement-id'>
                                				<div class='col-lg-2'>
                                                    <div class="form-horizontal">
                                                        <div class="form-group">
                                                        	<div class='col-md-12'>
                                                                <label class='control-label'>Transaction No.</label>
                                                                <input type='text' class='form-input form-control transactionnumber'>
                                                            </div>
                                                                
                                                        </div>
                                                    </div>
                                                    <div class="firstprevnextlastbtn">
                                                        <div class="btn-group btn-group-justified btn-group-sm margin-bottom-xs stock-item-refbuttons" role="group" aria-label="...">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" class="btn btn-default stock-item-firstbtn" data-info='first'>
                                                                    <span class="glyphicon glyphicon-fast-backward" aria-hidden="true"></span>
                                                                </button>
                                                            </div>
                                                            <div class="btn-group" role="group">
                                                                <button type="button" class="btn btn-default" data-info='second'>
                                                                    <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>
                                                                </button>
                                                            </div>
                                                            <div class="btn-group" role="group">
                                                                <button type="button" class="btn btn-default" data-info='third'>
                                                                    <span class="glyphicon glyphicon-forward" aria-hidden="true"></span>
                                                                </button>
                                                            </div>
                                                            <div class="btn-group" role="group">
                                                                <button type="button" class="btn btn-default" data-info='fourth'>
                                                                    <span class="glyphicon glyphicon-fast-forward" aria-hidden="true"></span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class='transaction-status-div margin-bottom-xs statusdiv'><br></div>
                                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#checkdisbursement-searchmodallookup'>
                                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="col-lg-10">

                                                	<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
							                            <div class="panel-group classictheme margin-bottom-xs" id="checkdisbursement-panelheader-wrapper" role="tablist" aria-multiselectable="true">

							                                    <div class="panel panel-default">
							                                        <div class="panel-heading" role="tab" data-toggle="collapse" href="#checkdisbursement-panelheader">
							                                                Header
							                                        </div>
							                                        <div id="checkdisbursement-panelheader" class="panel-collapse collapse in" role="tabpanel">
							                                            <div class="panel-body">
							                                            		<div class='row'>
								                                                	<div class="col-md-12">
									                                                    <div class="header-errordiv"></div>
									                                                </div>
									                                            </div>

									                                          

							                                                    <div class="form-horizontal">
							                                                        <div class="col-lg-7">
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Supplier</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control checkdisbursement-supplier'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Document Date</label>
							                                                                <div class="col-lg-5">
										                                                        <input type='text' class='form-control checkdisbursement-documentdate text-right alwaysdisabled' disabled="">
									                                                            
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'></label>
							                                                                <div class="col-lg-9">
									                                                            				<input type='checkbox' class='checkdisbursement-deposittosupplier' > 
									                                                            				<span class='input-group-addon-label' style='font-size: 12px; font-weight: 600'>&nbsp;Deposit to Supplier</span>
									                                                            			
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Remarks</label>
							                                                                <div class="col-lg-9">
							                                                                    <textarea class='form-control checkdisbursement-remarks' rows='3'></textarea>
							                                                                </div>
							                                                            </div>


							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Created</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control checkdisbursement-createdby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control checkdisbursement-createddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Updated</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control checkdisbursement-updatedby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control checkdisbursement-updateddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            
							                                                         

							                                                            
							                                                        </div>
							                                                        <div class='col-lg-5'>
							                                                        	<div class="form-group">
							                                                        		<label class='control-label col-lg-4'>Total Payments</label>
							                                                        		<div class='col-lg-8'>
								                                                                <input type='text' class='form-control checkdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<label class='control-label  col-lg-4'>Total Debits</label>
							                                                        		<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control checkdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Total Discounts</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control checkdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Grand Total</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control checkdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Unposted Payments</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control checkdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>

							                                                            
							                                                        </div>

							                                                        

							                                                        
							                                                    </div>
							                                            </div>
							                                        </div>
							                                    </div>
							                            </div>

							                            <div class='tabpane-white margin-top-20 margin-bottom-10'>
							                            	<ul class="nav nav-tabs">
							                            		<li role="presentation" class="active" id='checkdisbursement-details-paymentstab' data-pane='#checkdisbursement-details-paymentspane'><a href="#">Payments</a></li>
							                            		<li role="presentation" data-pane='#checkdisbursement-details-debitmemopane' id='checkdisbursement-details-debitmemotab'><a href="#">Debit Memo</a></li>
							                            		<li role="presentation" data-pane='#checkdisbursement-details-payablespane' id='checkdisbursement-details-payablestab'><a href="#">Payables</a></li>
							                            		<li role="presentation" data-pane='#checkdisbursement-details-linedetailspane' id='checkdisbursement-details-linedetailstab'><a href="#">Line Details</a></li>
							                            		<li role="presentation" data-pane='#checkdisbursement-details-applytoexpensepane' id='checkdisbursement-details-applytoexpensetab'><a href="#">Apply to Expense</a></li>
							                            	</ul>
							                            	<div class='tab-panes'>
							                            		<div class='pane active' id='checkdisbursement-details-paymentspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='checkdisbursement-paymentstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='checkdisbursement-details-debitmemopane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='checkdisbursement-debitmemotable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='checkdisbursement-details-payablespane'>
							                            			<table id='checkdisbursement-payablestable'>
			                                                                <tbody></tbody>

			                                                        </table>
							                            		</div>

							                            		<div class='pane' id='checkdisbursement-details-linedetailspane'>
							                            			<table id='checkdisbursement-linedetailstable'>
			                                                                <tbody></tbody>

			                                                        </table>
							                            		</div>

							                            		<div class='pane' id='checkdisbursement-details-applytoexpensepane'>
							                            			<table id='checkdisbursement-applytoexpensetable'>
			                                                                <tbody></tbody>

			                                                        </table>
							                            		</div>

							                            	</div>
							                            </div>

							                                        
							                        </div>

							                        <div class='col-md-12 no-padding margin-top-xs savecancelbuttonwrapper'>
							                            
							                        </div>

                                                </div>
                              
                        </div>


                        

                        

                    
                </div>
                <!-- CONTENT-END -->
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
	/**** INITIALIZED *******/
	$(document).ready(function(){
			var tabCHECKDISB = '#checkdisbursement-menutabpane';
			var inputfieldsCHECKDISB = ".checkdisbursement-inputfields";
			

			//$(tabCHECKDISB+' .modal-dialog').draggable();
			$(inputfieldsCHECKDISB+' input,'+inputfieldsCHECKDISB+' textarea,'+inputfieldsCHECKDISB+' select').attr('disabled','disabled');
        	$(inputfieldsCHECKDISB+' .transactionnumber').removeAttr('disabled').focus();
        	$(tabCHECKDISB+" .select2").select2();
        	var datetoday = new Date();
        	$(tabCHECKDISB+' .datepicker').datepicker();
        	$(tabCHECKDISB+' .datetimepicker').datetimepicker();

       
       		var refCHECKDISB = <?php echo json_encode($refCHECKDISB); ?>;
	        if(refCHECKDISB!=''){
	            getcheckdisbursementInformation(refCHECKDISB);
	            currentcheckdisbursementTxn = refCHECKDISB;
	        }

	        $(tabCHECKDISB+" #checkdisbursement-paymentstable").flexigrid({
                url: 'loadables/ajax/accounts-payable.check-disbursement.payments.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Withdrawn from Account', name : 'debitaccountnumber', width : 250, sortable : true, align: 'left'},
                        {display: 'Amount', name : 'debitaccountname', width : 150, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Withdrawn from Account', name : 'accountnumber', isdefault: true}
                        /*{display: 'Account Name', name : 'accountname'},
                        {display: 'Type', name : 'type'},
                        {display: 'Header Account', name : 'headeraccount'}*/
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
                height: 250,
                singleSelect: true
       		});

       		$(tabCHECKDISB+" #checkdisbursement-debitmemotable").flexigrid({
                url: 'loadables/ajax/accounts-payable.check-disbursement.debit-memo.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'DM #', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Date', name : 'debitaccountnumber', width : 100, sortable : true, align: 'left'},
                        {display: 'Remarks', name : 'debitaccountname', width : 250, sortable : true, align: 'left'},
                        {display: 'Balance', name : 'debitamount', width : 200, sortable : true, align: 'right'},
                        {display: 'Amount', name : 'creditaccountnumber', width : 150, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Remarks', name : 'accountnumber', isdefault: true}/*,
                        {display: 'Account Name', name : 'accountname'},
                        {display: 'Type', name : 'type'},
                        {display: 'Header Account', name : 'headeraccount'}*/
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
                height: 250,
                singleSelect: true
       		});

       		$(tabCHECKDISB+" #checkdisbursement-payablestable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.check-disbursement.payables.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Txn Type', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Txn No.', name : 'debitaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Txn Date', name : 'debitaccountname', width : 150, sortable : true, align: 'left'},
                        {display: 'Reference No.', name : 'debitamount', width : 150, sortable : true, align: 'left'},
                        {display: 'Orig. Amount Due', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'EWTAX', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Amount Due', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Txn Type', name : 'accountnumber', isdefault: true}/*,
                        {display: 'Account Name', name : 'accountname'},
                        {display: 'Type', name : 'type'},
                        {display: 'Header Account', name : 'headeraccount'}*/
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
                height: 250,
                singleSelect: true
       		});

       		$(tabCHECKDISB+" #checkdisbursement-applytoexpensetable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.check-disbursement.apply-to-expense.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Description', name : 'id', width : 250, sortable : true, align: 'left'},
                        {display: 'Account No.', name : 'debitaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Account Name', name : 'debitaccountname', width : 250, sortable : true, align: 'left'},
                        {display: 'Amount Due', name : 'debitamount', width : 150, sortable : true, align: 'left'},
                        {display: 'Payment', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Debit', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Discount', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Description', name : 'accountnumber', isdefault: true}/*,
                        {display: 'Account Name', name : 'accountname'},
                        {display: 'Type', name : 'type'},
                        {display: 'Header Account', name : 'headeraccount'}*/
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
                height: 250,
                singleSelect: true
       		});

	       
			
    		userAccess();


			

	});
	



</script>