<?php
     include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
    $refCLLCT = isset($_GET['reference'])?escapeString($_GET['reference']):'';
?>
<div class='header-page' >
	<div class='header-page-inner'>
		Collection
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
                <!-- CONTENT -->
                <div class='transaction-wrapper collection-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='collection-trans-newbtn' data-toggle='modal' href='#newcollectionmodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='collection-inputfields'>
                                				<input type='hidden' id='pgtxncollection-id'>
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
                                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#collection-searchmodallookup'>
                                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="col-lg-10">

                                                	<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
							                            <div class="panel-group classictheme margin-bottom-xs" id="collection-panelheader-wrapper" role="tablist" aria-multiselectable="true">

							                                    <div class="panel panel-default">
							                                        <div class="panel-heading" role="tab" data-toggle="collapse" href="#collection-panelheader">
							                                                Header
							                                        </div>
							                                        <div id="collection-panelheader" class="panel-collapse collapse in" role="tabpanel">
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
							                                                                    <input type='text' class='form-control collection-customer'>
							                                                                </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Form No.</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control collection-formnumber'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Document Date</label>
							                                                                <div class="col-lg-9">
							                                                                    <input type='text' class='form-control collection-documentdate'>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Remarks</label>
							                                                                <div class="col-lg-9">
							                                                                    <textarea class='form-control collection-remarks' rows='4'></textarea>
							                                                                </div>
							                                                            </div>


							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Created</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control collection-createdby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control collection-createddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                      <label class='control-label col-lg-3'>Updated</label>
							                                                         <div class="form-group">
							                                                                             <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control collection-updatedby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control collection-updateddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            
							                                                         

							                                                            
							                                                        </div>
							                                                        <div class='col-lg-3'>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Payments</label>
								                                                                <input type='text' class='form-control collection-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Credits</label>
								                                                                <input type='text' class='form-control collection-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Total Discounts</label>
								                                                                <input type='text' class='form-control collection-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Grand Total</label>
								                                                                <input type='text' class='form-control collection-totalpayments'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Unposted Payments</label>
								                                                                <input type='text' class='form-control collection-totalpayments'>
								                                                            </div>
							                                                            </div>

							                                                            
							                                                        </div>

							                                                        <div class='col-lg-2'>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>Retention</label>
								                                                                <input type='text' class='form-control collection-retention'>
								                                                            </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                        		<div class='col-lg-12'>
								                                                                <label class='control-label'>EWT/Other Deduction</label>
								                                                                <input type='text' class='form-control collection-otherdeduction'>
								                                                            </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                            	<div class='col-lg-12'>
								                                                                <label class='control-label'>Value Added Tax</label>
								                                                                <input type='text' class='form-control collection-vat'>
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
							                            		<li role="presentation" class="active" id='collection-details-paymentstab' data-pane='#collection-details-paymentspane'><a href="#">Payments</a></li>
							                            		<li role="presentation" data-pane='#collection-details-creditmemopane' id='collection-details-creditmemotab'><a href="#">Credit Memo</a></li>
							                            		<li role="presentation" data-pane='#collection-details-receivablespane' id='collection-details-receivablestab'><a href="#">Receivables</a></li>
							                            	</ul>
							                            	<div class='tab-panes'>
							                            		<div class='pane active' id='collection-details-paymentspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='collection-paymentstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='collection-details-creditmemopane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='collection-creditmemotable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='collection-details-receivablespane'>
							                            			<table id='collection-receivablestable'>
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

<div class="modal fade" id="add-collection-payments-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Payments
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='colladdpaymentdetailsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            
                            <label class='control-label'>Select Type</label>
                            <select class='form-control colladdpaymentdetailsmodal-mtdtype select2' name='colladdpaymentdetailsmodal-mtdtype'>
								
                            </select>
                        </div>
                        <div class="form-group"> 
                            <input type="text" name="coll-payments-no" id="coll-payments-no" class="form-control colladdpaymentdetailsmodal-no"/>
                        </div>
                        <div class="form-group">
                            <input type="number" name="colladdpaymentdetailsmodal-amt" id="colladdpaymentdetailsmodal-amt" class="form-control colladdpaymentdetailsmodal-amt">
                        </div>
                        <div class="form-group">
                            <select class='form-control colladdpaymentdetailsmodal-bankacc select2' name='colladdpaymentdetailsmodal-bankacc'>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="coll-payments-checkno" id="coll-payments-checkno" class="form-control colladdpaymentdetailsmodal-checkno"/>
                        </div>
                        <div class="form-group">
                            <select class='form-control colladdpaymentdetailsmodal-bank select2' name='colladdpaymentdetailsmodal-bank'>
                                <option value="1">BDO</option>
								<option value="2">BPI</option>
                                <option value="3">SECURITY BANK</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class='form-control colladdpaymentdetailsmodal-colltype select2' name='colladdpaymentdetailsmodal-colltype'>
                            </select>
                        </div>
                    </div>
                </form>
                <br>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button class='btn btn-blue2 mybtn' id='colladdpaymentdetailsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-collection-credit-memo-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Credit Memo
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='colladdpaymentdetailsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            <label class='control-label'>Select Type</label>
                            <select class='form-control add chartofaccountsmodal-type select2' name='colladdpaymentdetailsmodal-type'>
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
                    <button class='btn btn-blue2 mybtn' id='colladdpaymentdetailsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-collection-receivables-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    New Receivables
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method='post' id='colladdpaymentdetailsmodal-form'  enctype='multipart/form-data'>
                    <div class='col-md-4'>

                    </div>
                    <div class='col-md-offset-1 col-md-6'>
                    	<div class="form-group">
                            <label class='control-label'>Select Type</label>
                            <select class='form-control add chartofaccountsmodal-type select2' name='colladdpaymentdetailsmodal-type'>
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
                    <button class='btn btn-blue2 mybtn' id='colladdpaymentdetailsmodal-uploadbtn'>Save</button>
                    <button class='btn btn-blue2 mybtn modal-cancelbtn' >Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	/**** INITIALIZED *******/
	$(document).ready(function(){
			var tabCLLCT = '#collection-menutabpane';
			var inputfieldsCLLCT = ".collection-inputfields";
			

			//$(tabCLLCT+' .modal-dialog').draggable();
			$(inputfieldsCLLCT+' input,'+inputfieldsCLLCT+' textarea,'+inputfieldsCLLCT+' select').attr('disabled','disabled');
        	$(inputfieldsCLLCT+' .transactionnumber').removeAttr('disabled').focus();
        	$(tabCLLCT+" .select2").select2();
        	var datetoday = new Date();
        	$(tabCLLCT+' .datepicker').datepicker();
        	$(tabCLLCT+' .datetimepicker').datetimepicker();

       
       		var refCLLCT = <?php echo json_encode($refCLLCT); ?>;
	        if(refCLLCT!=''){
	            getcollectionInformation(refCLLCT);
	            currentcollectionTxn = refCLLCT;
	        }

	        $(tabCLLCT+" #collection-paymentstable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.collection.payments.php',
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
                        {name: 'Add', bclass: 'add', onpress : showaddcollectionpaymentsmodal},
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

       		$(tabCLLCT+" #collection-creditmemotable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.collection.credit-memo.php',
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
                        {name: 'Add', bclass: 'add', onpress :  showaddcollectioncreditmemomodal},
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

       		$(tabCLLCT+" #collection-receivablestable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.collection.receivables.php',
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
                        {name: 'Add', bclass: 'add', onpress : showaddcollectionreceivablesmodal},
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

			   function showaddcollectionpaymentsmodal(){
			$("#add-collection-payments-modal").modal('show')
		}

		function showaddcollectioncreditmemomodal(){
			$("#add-collection-credit-memo-modal").modal('show')
		}

		function showaddcollectionreceivablesmodal(){
			$("#add-collection-receivables-modal").modal('show')
		}

	       
			
    		userAccess();


			

	});
	



</script>