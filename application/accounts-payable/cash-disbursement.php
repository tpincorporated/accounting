<?php
     include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
    $refCASHDISB = isset($_GET['reference'])?escapeString($_GET['reference']):'';
?>
<div class='header-page' >
	<div class='header-page-inner'>
		Cash Disbursement
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
                <!-- CONTENT -->
                <div class='transaction-wrapper cashdisbursement-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='cashdisbursement-trans-newbtn' data-toggle='modal' href='#newcashdisbursementmodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='cashdisbursement-inputfields'>
                                				<input type='hidden' id='pgtxncashdisbursement-id'>
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
                                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#cashdisbursement-searchmodallookup'>
                                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="col-lg-10">

                                                	<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
							                            <div class="panel-group classictheme margin-bottom-xs" id="cashdisbursement-panelheader-wrapper" role="tablist" aria-multiselectable="true">

							                                    <div class="panel panel-default">
							                                        <div class="panel-heading" role="tab" data-toggle="collapse" href="#cashdisbursement-panelheader">
							                                                Header
							                                        </div>
							                                        <div id="cashdisbursement-panelheader" class="panel-collapse collapse in" role="tabpanel">
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
							                                                                    <input type='text' class='form-control cashdisbursement-supplier'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Document Date</label>
							                                                                <div class="col-lg-5">
										                                                        <input type='text' class='form-control cashdisbursement-documentdate text-right alwaysdisabled' disabled="">
									                                                            
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'></label>
							                                                                <div class="col-lg-9">
									                                                            				<input type='checkbox' class='cashdisbursement-deposittosupplier' > 
									                                                            				<span class='input-group-addon-label' style='font-size: 12px; font-weight: 600'>&nbsp;Deposit to Supplier</span>
									                                                            			
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Remarks</label>
							                                                                <div class="col-lg-9">
							                                                                    <textarea class='form-control cashdisbursement-remarks' rows='3'></textarea>
							                                                                </div>
							                                                            </div>


							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Created</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control cashdisbursement-createdby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control cashdisbursement-createddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Updated</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control cashdisbursement-updatedby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control cashdisbursement-updateddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            
							                                                         

							                                                            
							                                                        </div>
							                                                        <div class='col-lg-5'>
							                                                        	<div class="form-group">
							                                                        		<label class='control-label col-lg-4'>Total Payments</label>
							                                                        		<div class='col-lg-8'>
								                                                                <input type='text' class='form-control cashdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<label class='control-label  col-lg-4'>Total Debits</label>
							                                                        		<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control cashdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Total Discounts</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control cashdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Grand Total</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control cashdisbursement-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<label class='control-label  col-lg-4'>Unposted Payments</label>
							                                                            	<div class='col-lg-8'>
								                                                                
								                                                                <input type='text' class='form-control cashdisbursement-totalpayments'>
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
							                            		<li role="presentation" class="active" id='cashdisbursement-details-paymentstab' data-pane='#cashdisbursement-details-paymentspane'><a href="#">Payments</a></li>
							                            		<li role="presentation" data-pane='#cashdisbursement-details-debitmemopane' id='cashdisbursement-details-debitmemotab'><a href="#">Debit Memo</a></li>
							                            		<li role="presentation" data-pane='#cashdisbursement-details-payablespane' id='cashdisbursement-details-payablestab'><a href="#">Payables</a></li>
							                            		<li role="presentation" data-pane='#cashdisbursement-details-linedetailspane' id='cashdisbursement-details-linedetailstab'><a href="#">Line Details</a></li>
							                            		<li role="presentation" data-pane='#cashdisbursement-details-applytoexpensepane' id='cashdisbursement-details-applytoexpensetab'><a href="#">Apply to Expense</a></li>
							                            	</ul>
							                            	<div class='tab-panes'>
							                            		<div class='pane active' id='cashdisbursement-details-paymentspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='cashdisbursement-paymentstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='cashdisbursement-details-debitmemopane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='cashdisbursement-debitmemotable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='cashdisbursement-details-payablespane'>
							                            			<table id='cashdisbursement-payablestable'>
			                                                                <tbody></tbody>

			                                                        </table>
							                            		</div>

							                            		<div class='pane' id='cashdisbursement-details-linedetailspane'>
							                            			<table id='cashdisbursement-linedetailstable'>
			                                                                <tbody></tbody>

			                                                        </table>
							                            		</div>

							                            		<div class='pane' id='cashdisbursement-details-applytoexpensepane'>
							                            			<table id='cashdisbursement-applytoexpensetable'>
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
			var tabCASHDISB = '#cashdisbursement-menutabpane';
			var inputfieldsCASHDISB = ".cashdisbursement-inputfields";
			

			//$(tabCASHDISB+' .modal-dialog').draggable();
			$(inputfieldsCASHDISB+' input,'+inputfieldsCASHDISB+' textarea,'+inputfieldsCASHDISB+' select').attr('disabled','disabled');
        	$(inputfieldsCASHDISB+' .transactionnumber').removeAttr('disabled').focus();
        	$(tabCASHDISB+" .select2").select2();
        	var datetoday = new Date();
        	$(tabCASHDISB+' .datepicker').datepicker();
        	$(tabCASHDISB+' .datetimepicker').datetimepicker();

       
       		var refCASHDISB = <?php echo json_encode($refCASHDISB); ?>;
	        if(refCASHDISB!=''){
	            getcashdisbursementInformation(refCASHDISB);
	            currentcashdisbursementTxn = refCASHDISB;
	        }

	        $(tabCASHDISB+" #cashdisbursement-paymentstable").flexigrid({
                url: 'loadables/ajax/accounts-payable.cash-disbursement.payments.php',
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

       		$(tabCASHDISB+" #cashdisbursement-debitmemotable").flexigrid({
                url: 'loadables/ajax/accounts-payable.cash-disbursement.debit-memo.php',
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

       		$(tabCASHDISB+" #cashdisbursement-payablestable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.cash-disbursement.payables.php',
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

       		$(tabCASHDISB+" #cashdisbursement-applytoexpensetable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.cash-disbursement.apply-to-expense.php',
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