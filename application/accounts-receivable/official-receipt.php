<?php
     include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
    $refOR = isset($_GET['reference'])?escapeString($_GET['reference']):'';
?>
<div class='header-page' >
	<div class='header-page-inner'>
		Official Receipt
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
                <!-- CONTENT -->
                <div class='transaction-wrapper officialreceipt-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='officialreceipt-trans-newbtn' data-toggle='modal' href='#newofficialreceiptmodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='officialreceipt-inputfields'>
                                				<input type='hidden' id='pgtxnofficialreceipt-id'>
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
                                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#officialreceipt-searchmodallookup'>
                                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="col-lg-10">

                                                	<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
							                            <div class="panel-group classictheme margin-bottom-xs" id="officialreceipt-panelheader-wrapper" role="tablist" aria-multiselectable="true">

							                                    <div class="panel panel-default">
							                                        <div class="panel-heading" role="tab" data-toggle="collapse" href="#officialreceipt-panelheader">
							                                                Header
							                                        </div>
							                                        <div id="officialreceipt-panelheader" class="panel-collapse collapse in" role="tabpanel">
							                                            <div class="panel-body">
							                                            		<div class='row'>
								                                                	<div class="col-md-12">
									                                                    <div class="header-errordiv"></div>
									                                                </div>
									                                            </div>

									                                          

							                                                    <div class="form-horizontal">
							                                                        <div class="col-lg-7">
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Customer</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control officialreceipt-customer'>
							                                                                </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Form No.</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control officialreceipt-formnumber'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Document Date</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control officialreceipt-documentdate'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Remarks</label>
							                                                                <div class="col-lg-9">
							                                                                    <textarea class='form-control officialreceipt-remarks' rows='4'></textarea>
							                                                                </div>
							                                                            </div>


							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Created</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control officialreceipt-createdby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control officialreceipt-createddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Updated</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control officialreceipt-updatedby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control officialreceipt-updateddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            
							                                                         

							                                                            
							                                                        </div>
							                                                        <div class='col-lg-3'>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Payments</label>
								                                                                <input type='text' class='form-control officialreceipt-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Credits</label>
								                                                                <input type='text' class='form-control officialreceipt-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Discounts</label>
								                                                                <input type='text' class='form-control officialreceipt-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Grand Total</label>
								                                                                <input type='text' class='form-control officialreceipt-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Unposted Payments</label>
								                                                                <input type='text' class='form-control officialreceipt-totalpayments'>
								                                                            </div>
							                                                            </div>

							                                                            
							                                                        </div>

							                                                        <div class='col-lg-2'>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Retention</label>
								                                                                <input type='text' class='form-control officialreceipt-retention'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>EWT/Other Deduction</label>
								                                                                <input type='text' class='form-control officialreceipt-otherdeduction'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Value Added Tax</label>
								                                                                <input type='text' class='form-control officialreceipt-vat'>
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
							                            		<li role="presentation" class="active" id='officialreceipt-details-paymentstab' data-pane='#officialreceipt-details-paymentspane'><a href="#">Payments</a></li>
							                            		<li role="presentation" data-pane='#officialreceipt-details-creditmemopane' id='officialreceipt-details-creditmemotab'><a href="#">Credit Memo</a></li>
							                            		<li role="presentation" data-pane='#officialreceipt-details-receivablespane' id='officialreceipt-details-receivablestab'><a href="#">Receivables</a></li>
							                            	</ul>
							                            	<div class='tab-panes'>
							                            		<div class='pane active' id='officialreceipt-details-paymentspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='officialreceipt-paymentstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='officialreceipt-details-creditmemopane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='officialreceipt-creditmemotable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='officialreceipt-details-receivablespane'>
							                            			<table id='officialreceipt-receivablestable'>
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


<div class="modal fade" id="add-official-receipt-payments-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Payments
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='addchartofaccountsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            <label class='control-label'>Select Type</label>
                            <select class='form-control add chartofaccountsmodal-type select2' name='addchartofaccountsmodal-type'>
								<option value="Detail">Detail</option>
								<option value="Detail">Header</option>
                            </select>
                        </div>
                        <div class="form-group"> 

                        </div>
                    </div>
                </form>
                <br>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button class='btn btn-blue2 mybtn' id='addchartofaccountsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-official-receipt-credit-memo-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Credit Memo
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='addchartofaccountsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            <label class='control-label'>Select Type</label>
                            <select class='form-control add chartofaccountsmodal-type select2' name='addchartofaccountsmodal-type'>
								<option value="Detail">Detail</option>
								<option value="Detail">Header</option>
                            </select>
                        </div>
                        <div class="form-group"> 

                        </div>
                    </div>
                </form>
                <br>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button class='btn btn-blue2 mybtn' id='addchartofaccountsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-official-receipt-receivables-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Receivables
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='addchartofaccountsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            <label class='control-label'>Select Type</label>
                            <select class='form-control add chartofaccountsmodal-type select2' name='addchartofaccountsmodal-type'>
								<option value="Detail">Detail</option>
								<option value="Detail">Header</option>
                            </select>
                        </div>
                        <div class="form-group"> 

                        </div>
                    </div>
                </form>
                <br>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button class='btn btn-blue2 mybtn' id='addchartofaccountsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
	/**** INITIALIZED *******/
	$(document).ready(function(){
			var tabOR = '#officialreceipt-menutabpane';
			var inputfieldsOR = ".officialreceipt-inputfields";
			

			//$(tabOR+' .modal-dialog').draggable();
			$(inputfieldsOR+' input,'+inputfieldsOR+' textarea,'+inputfieldsOR+' select').attr('disabled','disabled');
        	$(inputfieldsOR+' .transactionnumber').removeAttr('disabled').focus();
        	$(tabOR+" .select2").select2();
        	var datetoday = new Date();
        	$(tabOR+' .datepicker').datepicker();
        	$(tabOR+' .datetimepicker').datetimepicker();

       
       		var refOR = <?php echo json_encode($refOR); ?>;
	        if(refOR!=''){
	            getofficialreceiptInformation(refOR);
	            currentofficialreceiptTxn = refOR;
	        }

	        $(tabOR+" #officialreceipt-paymentstable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.officialreceipt.payments.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Method', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Deposited to Account', name : 'debitaccountnumber', width : 250, sortable : true, align: 'left'},
                        {display: 'Amount', name : 'debitaccountname', width : 150, sortable : true, align: 'left'},
                        {display: 'Bank', name : 'debitamount', width : 200, sortable : true, align: 'right'},
                        {display: 'Check No.', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Check Date', name : 'creditaccountname', width : 100, sortable : true, align: 'left'},
                        {display: 'Check Amount', name : 'creditamount', width : 150, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : showaddofficialreceiptpaymentsmodal},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Method', name : 'accountnumber', isdefault: true},
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
                height: 250,
                singleSelect: true
       		});

       		$(tabOR+" #officialreceipt-creditmemotable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.officialreceipt.credit-memo.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'CM #', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Date', name : 'debitaccountnumber', width : 100, sortable : true, align: 'left'},
                        {display: 'Remarks', name : 'debitaccountname', width : 250, sortable : true, align: 'left'},
                        {display: 'Balance', name : 'debitamount', width : 200, sortable : true, align: 'right'},
                        {display: 'Amount', name : 'creditaccountnumber', width : 150, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : showaddofficialreceiptcreditmemomodal},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Remarks', name : 'accountnumber', isdefault: true},
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
                height: 250,
                singleSelect: true
       		});

       		$(tabOR+" #officialreceipt-receivablestable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.officialreceipt.receivables.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Txn Type', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Txn No.', name : 'debitaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Txn Date', name : 'debitaccountname', width : 150, sortable : true, align: 'left'},
                        {display: 'Invoice No.', name : 'debitamount', width : 150, sortable : true, align: 'left'},
                        {display: 'DR No.', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Amount Due', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Payment', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Credit Amount', name : 'creditaccountnumber', width : 150, sortable : true, align: 'left'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : showaddofficialreceiptreceivablesmodal},
                        {separator: true},
                        {name: 'Delete', bclass: 'delete', onpress : ''}
                        /*{separator: true},
                        {name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
                ],
                searchitems : [
                        {display: 'Remarks', name : 'accountnumber', isdefault: true},
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
                height: 250,
                singleSelect: true
       		});

	       
			   function showaddofficialreceiptpaymentsmodal(){
			$("#add-official-receipt-payments-modal").modal('show')
		}

		function showaddofficialreceiptcreditmemomodal(){
			$("#add-official-receipt-credit-memo-modal").modal('show')
		}

		function showaddofficialreceiptreceivablesmodal(){
			$("#add-official-receipt-receivables-modal").modal('show')
		}

			
    		userAccess();


			

	});
	



</script>