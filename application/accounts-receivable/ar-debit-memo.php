<?php
     include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
    $refARDEBITMEMO = isset($_GET['reference'])?escapeString($_GET['reference']):'';
?>
<div class='header-page' >
	<div class='header-page-inner'>
		AR Debit Memo
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
        <div class="panel panel-primary mypanel">
            <div class="panel-body">
                <!-- CONTENT -->
                <div class='transaction-wrapper ardebitmemo-content'>

                        <div class='col-md-12 no-padding margin-bottom-sm topbuttonsdiv'>
                            <div class='padded-with-border-engraved topbuttonswrapper'>
                                <div class='button-group'>
                                    <div class='button-group-btn active' title='New' id='ardebitmemo-trans-newbtn' data-toggle='modal' href='#newardebitmemomodal'>
                                        <img src="../resources/img/add.png">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class='ardebitmemo-inputfields'>
                                				<input type='hidden' id='pgtxnardebitmemo-id'>
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
                                                    <div class='button-group-btn fluid searchbtn active' data-toggle='modal' href='#ardebitmemo-searchmodallookup'>
                                                        <!--<i class='fa fa-search fa-lg fa-space'></i>-->
                                                        <img src="../resources/img/search.png">&nbsp;&nbsp;Search
                                                    </div>
                                                    <br>
                                                </div>
                                                <div class="col-lg-10">

                                                	<div class='col-md-12 no-padding margin-bottom-xs margin-top-sm'>
							                            <div class="panel-group classictheme margin-bottom-xs" id="ardebitmemo-panelheader-wrapper" role="tablist" aria-multiselectable="true">

							                                    <div class="panel panel-default">
							                                        <div class="panel-heading" role="tab" data-toggle="collapse" href="#ardebitmemo-panelheader">
							                                                Header
							                                        </div>
							                                        <div id="ardebitmemo-panelheader" class="panel-collapse collapse in" role="tabpanel">
							                                            <div class="panel-body">
							                                            		<div class='row'>
								                                                	<div class="col-md-12">
									                                                    <div class="header-errordiv"></div>
									                                                </div>
									                                            </div>

									                                          

							                                                    <div class="form-horizontal">
							                                                        <div class="col-lg-7">
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Type</label>
							                                                                <div class="col-lg-9">
							                                                                    <select class='form-control ardebitmemo-type'>
							                                                                    	<option value=''>Customer</option>
							                                                                    </select>
							                                                                </div>
							                                                            </div>
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'></label>
							                                                                <div class="col-lg-9">
							                                                                    <select class='form-control ardebitmemo-subject'>
							                                                                    	<option value=''></option>
							                                                                    </select>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Amount</label>
							                                                                <div class="col-lg-4">
																									   <div class='input-group'>
										                                                                    <input type='text' class='form-control ardebitmemo-amount text-right alwaysdisabled' disabled="">
										                                                                    <span class="input-group-addon inputgroupbtn" style='line-height: 0px'>
										                                                                    	&nbsp;&nbsp;
									                                                            				<input type='checkbox' class='waybill-zeroratedcheckbox' > <span class='input-group-addon-label' style='font-size: 12px; font-weight: 600'>&nbsp;Beginning Balance</span>
									                                                            			</span>
									                                                            		</div>
							                                                                    
							                                                                    
							                                                                </div>


							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Remarks</label>
							                                                                <div class="col-lg-9">
							                                                                    <textarea class='form-control ardebitmemo-remarks' rows='4'></textarea>
							                                                                </div>
							                                                            </div>


							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Created</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control ardebitmemo-createdby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control ardebitmemo-createddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Updated</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									    <input type="text" class='form-control ardebitmemo-updatedby alwaysdisabled' disabled="true" >
																									    <input type="text" class='form-control ardebitmemo-updateddate alwaysdisabled' disabled="true">
																								</div>
							                                                                </div>
							                                                            </div>
							                                                            
							                                                         

							                                                            
							                                                        </div>
							                                                        <div class='col-lg-5'>
							                                                        	<div class="form-group">
							                                                                <label class='control-label col-lg-3'>Date</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									   <input type='text' class='form-control ardebitmemo-date'>
																								</div>
							                                                                    
							                                                                    
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Source Type</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									   <input type='text' class='form-control ardebitmemo-date'>
																								</div>
							                                                                    
							                                                                    
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Source No.</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									   <input type='text' class='form-control ardebitmemo-date'>
																								</div>
							                                                                    
							                                                                    
							                                                                </div>
							                                                            </div>
							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Posted</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									   <input type='text' class='form-control ardebitmemo-date'>
																								</div>
							                                                                    
							                                                                    
							                                                                </div>
							                                                            </div>

							                                                            <div class="form-group">
							                                                                <label class='control-label col-lg-3'>Balance</label>
							                                                                <div class="col-lg-9">
							                                                                	<div class="input-group">
																									   <input type='text' class='form-control ardebitmemo-date'>
																								</div>
							                                                                    
							                                                                    
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
							                            		<li role="presentation" class="active" id='ardebitmemo-details-postingdetailstab' data-pane='#ardebitmemo-details-postingdetailspane'><a href="#">Posting Details</a></li>
							                            		<li role="presentation" data-pane='#ardebitmemo-details-accountdetailspane' id='ardebitmemo-details-accountdetailstab'><a href="#">Account Details</a></li>
							                            	</ul>
							                            	<div class='tab-panes'>
							                            		<div class='pane active' id='ardebitmemo-details-postingdetailspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='ardebitmemo-postingdetailstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
							                            		</div>
							                            		<div class='pane' id='ardebitmemo-details-accountdetailspane'>
							                            			<div class="pane-content table-sm">
							                            				<table id='ardebitmemo-accountdetailstable'>
			                                                                <tbody></tbody>

			                                                            </table>
							                            			</div>
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
			var tabARDEBITMEMO = '#ardebitmemo-menutabpane';
			var inputfieldsARDEBITMEMO = ".ardebitmemo-inputfields";
			

			//$(tabARDEBITMEMO+' .modal-dialog').draggable();
			$(inputfieldsARDEBITMEMO+' input,'+inputfieldsARDEBITMEMO+' textarea,'+inputfieldsARDEBITMEMO+' select').attr('disabled','disabled');
        	$(inputfieldsARDEBITMEMO+' .transactionnumber').removeAttr('disabled').focus();
        	$(tabARDEBITMEMO+" .select2").select2();
        	var datetoday = new Date();
        	$(tabARDEBITMEMO+' .datepicker').datepicker();
        	$(tabARDEBITMEMO+' .datetimepicker').datetimepicker();

       
       		var refARDEBITMEMO = <?php echo json_encode($refARDEBITMEMO); ?>;
	        if(refARDEBITMEMO!=''){
	            getDEBITMEMOInformation(refARDEBITMEMO);
	            currentDEBITMEMOTxn = refARDEBITMEMO;
	        }

	        $(tabARDEBITMEMO+" #ardebitmemo-postingdetailstable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.debit-memo.posting-details.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Txn Type', name : 'id', width : 200, sortable : true, align: 'left'},
                        {display: 'Txn No.', name : 'debitaccountnumber', width : 200, sortable : true, align: 'left'},
                        {display: 'Date', name : 'debitaccountname', width : 200, sortable : true, align: 'left'},
                        {display: 'Amount', name : 'debitamount', width : 200, sortable : true, align: 'right'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
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

       		$(tabARDEBITMEMO+" #ardebitmemo-accountdetailstable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.debit-memo.account-details.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Account No.', name : 'id', width : 200, sortable : true, align: 'left'},
                        {display: 'Account Name', name : 'debitaccountnumber', width : 200, sortable : true, align: 'left'},
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

       		$(tabARDEBITMEMO+" #ardebitmemo-otherstable").flexigrid({
                url: 'loadables/ajax/accounts-receivable.debit-memo.others.php',
                dataType: 'json',
                colModel : [
                        {display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
                        {display: 'Source Type', name : 'id', width : 150, sortable : true, align: 'left'},
                        {display: 'Source No.', name : 'debitaccountnumber', width : 150, sortable : true, align: 'left'},
                        {display: 'Amount', name : 'debitaccountname', width : 150, sortable : true, align: 'left'}
                ],
                buttons : [
                        {name: 'Add', bclass: 'add', onpress : ''},
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

	       
			
    		userAccess();


			

	});
	



</script>