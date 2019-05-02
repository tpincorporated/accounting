<?php
	include("../config/connection.php");
	include("../config/checklogin.php");
	if(isset($_SESSION['MdjKeoIdhk'])){
		$viewtobeloaded = $_SESSION['MdjKeoIdhk'];
	}else{
		$viewtobeloaded = "";
	}

	

?>

<!doctype html>
<html>
	<head>

		<title>Accounting Management System</title>
		<meta name="viewport" content="width=device-width, initial-scale=.7">
		<link rel="stylesheet" href="../css/bootstrap.css">

		

		<link rel="stylesheet" href="../css/main.css">
		<!--<link href='https://fonts.googleapis.com/css?family=Pacifico|Open+Sans|Lato:400,700,300,900|Carter+One' rel='stylesheet' type='text/css'>-->
		<!--<link rel="shortcut icon" href="../resources/icon.ico">-->

		<!--<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>-->

    	<!--<link rel="stylesheet" href="../resources/tags/dist/bootstrap-tagsinput.css">-->

		<link href="../css/fontAwesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="../css/animate.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src='../js/functions.js'></script>

		<!-- FOR DROPDOWN -->
		<link href="../resources/select/dist/css/select2.css" rel="stylesheet" />


		<!-- DIALOG, CONFIRM, ALERTS-->
		<link rel="stylesheet" type="text/css" href="../resources/dialog/jquery-confirm.css" />

		<!--DATE PICKER -->
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.css">
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.theme.css">
		<link rel="stylesheet" href="../resources/datepicker/jquery-ui.structure.css">
		<!--<link rel="stylesheet" href="../resources/jquery-interactions/jquery-ui2.css">-->

		<!-- DATATABLES -->
		<link rel="stylesheet" href="../resources/datatables/media/css/dataTables.bootstrap.css">

		<!-- COLOR PICKER -->
		<link href="../resources/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

		<!-- FLEXIGRID -->
		<link rel="stylesheet" href="../resources/flexigrid/css/flexigrid.css">
		<link rel="stylesheet" href="../resources/flexigrid/css/kaye_custom.css">
		<link rel="stylesheet" href="../resources/flexigrid/custom.css">

		<link rel="stylesheet" href="../resources/timepicker-addon/src/jquery-ui-timepicker-addon.css">


		<link rel="stylesheet" href="../css/bootstrap-toggle.css">

		<!-- TAGS -->
		<link rel="stylesheet" href="../resources/tags/bootstrap-tagsinput.css">
		<link rel="stylesheet" href="../resources/tags/custom.css">

		<!-- BOOTSTRAP TABLE -->
		<link rel="stylesheet" href="../resources/bootstrap-table/dist/bootstrap-table.css">

		<!-- TREE -->
		<link rel="stylesheet" href="../resources/jstree/dist/themes/default/style.css">



		







		<!-- GRAPHS -->

		<!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<link rel="stylesheet" href="../resources/chartist/chartist.css">-->






	</head>
	<body style='background-color: #EAEFF2;' tabindex='1' class='gray-theme'>
		<div id='loading-img' style='width:100%; height:100%; position:absolute; z-index:1000000000; background-color:rgba(255, 255, 255, 0);'> 
				<img src="../resources/img/loading.gif" height='180px'  style='position:fixed; z-index:10000; top:35%; left:43%;'>
		</div>		
			    <!-- ********************************* MOBILE NAV *********************************************************************-->
    			<div class="visible-xs visible-sm">
        			<div class="navbar navbar-inverse navbar-fixed-top">
           				<div class="container">

                			<div class="navbar-header">
			                    <div class="navbar-brand">WMS</div>
			                    <button class="navbar-toggle" data-toggle="collapse" data-target=".collapseThisNav">
			                        <span class="icon-bar"></span>
			                        <span class="icon-bar"></span>
			                        <span class="icon-bar"></span>
			                    </button>
			                </div>

			                <div class="collapse navbar-collapse collapseThisNav">
			                    <ul class="nav navbar-nav">
			                    	<li class='nosubmenu' data-file='dashboard.php'><a>Dashboard</a></li>
			                        
			                        <li class="dropdown hidden" data-id='system-section'>
			                            <a class="dropdown-toggle" data-toggle="dropdown">System &nbsp;<i class='fa fa-caret-down'></i></a>
			                                <ul class="dropdown-menu">
			                                	 <li class='nosubmenu hidden' data-file='system/configuration.php' data-id='configuration' data-js='configuration.js'>
				                                	<a>Configuration</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/user.php' data-id='user' data-js='user.js'>
				                                	<a>User</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/user-group.php' data-js='user-group.js' data-id='usergroup'>
				                                	<a>User Group</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/approver.php' data-id='approver' data-js='approver.js'>
				                                	<a>Approver</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/transaction-type.php' data-js='transaction-type.js' data-id='transaction'>
				                                	<a>Transaction Type</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/system-log.php' data-js='system-log.js' data-id='transaction'>
				                                	<a>System Log</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='system/department.php' data-js='department.js' data-id='department-menu'>
				                                	<a>Department</a>
				                                </li>
				                                <li class='nosubmenu hidden' data-file='inventory/stock-receipt.php' data-js='stock-receipt.js' data-id='stockreceipt-menu'>
				                                	<a>Stock Receipt</a>
				                                </li>

			                                </ul>   
			                        </li>
			                         <li class="dropdown hidden" data-id='maintenance-section'>
          								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Maintenance&nbsp; <span class="caret"></span></a>
							          	<ul class="dropdown-menu">
								            <li class='nosubmenu hidden' data-file='maintenance/items.php' data-js='item.js' data-id='items'>
			                                	<a>Item</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='maintenance/supplier.php' data-js='supplier.js' data-id='supplier'>
			                                	<a>Supplier</a>
			                         		 </li>
			                                <li class='nosubmenu hidden' data-file='maintenance/terms-of-payment.php' data-js='terms-of-payment.js' data-id='terms'>
			                                	<a>Term of Payment</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='maintenance/section-department.php'  data-js='section-department.js' data-id='department'>
			                                	<a>Section/Department</a>
			                                </li>

         								 </ul>
       								</li>
       								<li class="dropdown hidden" data-id='transaction-section'>
          								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Transaction&nbsp;<span class="caret"></span></a>
							          	<ul class="dropdown-menu">
										    <li class='nosubmenu hidden' data-file='transaction/purchase-requisition.php' data-js='purchase-requisition.js' data-id='pr'>
			                                	<a>Purchase Requisition</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='transaction/purchase-order.php' data-js='purchase-order.js' data-id='po'>
			                                	<a>Purchase Order</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='transaction/receiving.php' data-js='receiving.js' data-id='receiving'>
			                                	<a>Receiving</a>
			                                </li>

         								 </ul>
       								</li>
       								<li class="dropdown hidden" data-id='reports-section'>
          								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reports&nbsp; <span class="caret"></span></a>
							          	<ul class="dropdown-menu">
							          		<li class='nosubmenu hidden' data-file='reports/pr-summary.php' data-js='pr-summary.js' data-id='prsumm'>
			                                	<a>Purchase Request Summary</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='reports/po-summary.php' data-js='po-summary.js' data-id='posumm'>
			                                	<a>Purchase Order Summary</a>
			                                </li>
			                                <li class='nosubmenu hidden' data-file='reports/rcv-summary.php' data-js='rcv-summary.js' data-id='rcvsumm'>
			                                	<a>Receiving Summary</a>
			                                </li>
							          	</ul>
							         </li>
							         <li><a href='logout.php'>Logout</a></li>
			                       




			                    </ul>
			                </div>

			            </div>
			        </div>
			    </div>
			    <!-- ********************************* END MOBILE NAV ******************************************************************-->





			   <!-- ************************************ SIDEBAR NAV ****************************************************************** -->
			   <div id="sidebar">
			   		<div id='sidebar-panel'>
				   		<div id="sidebar-nav">
				   			<div class="sidebarlogo">
				   				<a href=''><img class='img img-responsive' src="../resources/logo.png"></a>
				   			</div>
				   			<div class='nosubmenu active' data-title='Dashboard' data-file='dashboard.php' data-js='dashboard.js' id='dash'>
				   				<img class='img' src="../resources/icons/main-home.png"><span>Dashboard</span>
				   			</div>
				   			<div class='withsubmenu' id='system-section'>
				   				<img class='img' src="../resources/icons/main-system.png">System
				   			</div>
				   			<div class="submenu">
				   				<div data-title='Configuration' data-file='system/configuration.php' id='configuration-menu' data-js='configuration.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Configuration
				   				</div>
				   				<div data-title='User' data-file='system/user.php' id='user-menu' data-js='user.js'>
				   					<img class='img' src="../resources/img/folder_64.png">User
				   				</div>
				   				<div data-title='User Group' data-file='system/user-group.php' id='usergroup-menu' data-js='user-group.js'>
				   					<img class='img' src="../resources/img/folder_64.png">User Group
				   				</div>
				   				<div data-title='Transaction Type' data-file='system/transaction-type.php' data-js='transaction-type.js' id='transactiontype-menu'>
				   					<img class='img' src="../resources/img/folder_64.png">Transaction Type
				   				</div>
				   				<div data-title='System Log' data-file='system/system-log.php' data-js='system-log.js' id='systemlog-menu'>
				   					<img class='img' src="../resources/img/folder_64.png">System Log
				   				</div>
				   			</div>
		                    <!--<div class='withsubmenu' id='maintenance-section'><img class='img' src="../resources/icons/main-sales.png">Maintenance</div>
				   			<div class="submenu">
				   				<div  data-title='Warehouse' data-file='maintenance/location.php' id='location-menu' data-js='location.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Location
				   				</div>
				   				<div  data-title='Supplier Group' data-file='maintenance/supplier-group.php' id='suppliergroup-menu' data-js='supplier-group.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Supplier Group
				   				</div>
				   				<div  data-title='Customer Group' data-file='maintenance/client-group.php' id='clientgroup-menu' data-js='client-group.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Customer Group
				   				</div>
				   				<div  data-title='Category' data-file='maintenance/category.php' id='category-menu' data-js='category.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Category
				   				</div>
				   				<div  data-title='Terms' data-file='maintenance/terms.php' id='terms-menu' data-js='terms.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Terms
				   				</div>
				   				<div  data-title='Supplier' data-file='maintenance/supplier.php' id='supplier-menu' data-js='supplier.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Supplier
				   				</div>
				   				<div  data-title='Customer' data-file='maintenance/customer.php' id='customer-menu' data-js='customer.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Customer
				   				</div>
				   				
		                    </div>-->
		                    <div class='withsubmenu' id='generalledger-section'><img class='img' src="../resources/icons/main-purchases.png">General Ledger</div>
				   			<div class="submenu">
				   				
				   				<div  data-title='Financial Period' data-file='general-ledger/financial-period.php' id='financialperiod-menu' data-js='financial-period.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Financial Period
				   				</div>
				   				<div  data-title='Chart of Accounts' data-file='general-ledger/chart-of-accounts.php' id='chartofaccounts-menu' data-js='chart-of-accounts.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Chart of Accounts
				   				</div>
				   				<div  data-title='Default Accounts' data-file='general-ledger/default-accounts.php' id='defaultaccounts-menu' data-js='default-accounts.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Default Accounts
				   				</div>
				   				<div  data-title='Journal Entries' data-file='general-ledger/journal-entries.php' id='journalentries-menu' data-js='financial-period.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Journal Entries
				   				</div>
				   				
				   				
		                    </div>
		                    <div class='withsubmenu' id='accountsreceivable-section'><img class='img' src="../resources/icons/main-purchases.png">Accounts Receivable</div>
				   			<div class="submenu">
				   				
				   				<div  data-title='Collection' data-file='accounts-receivable/collection.php' id='collection-menu' data-js='collection.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Collection
				   				</div>
				   				<div  data-title='AR Credit Memo' data-file='accounts-receivable/ar-credit-memo.php' id='arcreditmemo-menu' data-js='ar-credit-memo.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Credit Memo
				   				</div>
				   				<div  data-title='AR Debit Memo' data-file='accounts-receivable/ar-debit-memo.php' id='ardebitmemo-menu' data-js='ar-debit-memo.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Debit Memo
				   				</div>
				   				<div  data-title='Official Receipt' data-file='accounts-receivable/official-receipt.php' id='officialreceipt-menu' data-js='official-receipt.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Official Receipt
				   				</div>
				   				
				   				
		                    </div>
		                    <div class='withsubmenu' id='accountspayable-section'><img class='img' src="../resources/icons/main-purchases.png">Accounts Payable</div>
				   			<div class="submenu">
				   				
				   				<div  data-title='Cash Disbursement' data-file='accounts-payable/cash-disbursement.php' id='cashdisbursement-menu' data-js='cash-disbursement.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Cash Disbursement
				   				</div>
				   				<div  data-title='Check Disbursement' data-file='accounts-payable/check-disbursement.php' id='checkdisbursement-menu' data-js='check-disbursement.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Check Disbursement
				   				</div>
				   				<div  data-title='Disbursement Batch' data-file='accounts-payable/disbursement-batch.php' id='disbursementbatch-menu' data-js='disbursement-batch.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Disbursement Batch
				   				</div>
				   				<div  data-title='AP Debit Memo' data-file='accounts-payable/ap-debit-memo.php' id='apdebitmemo-menu' data-js='ap-debit-memo.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Debit Memo
				   				</div>
				   				<div  data-title='AP Credit Memo' data-file='accounts-payable/ap-credit-memo.php' id='apcreditmemo-menu' data-js='ap-credit-memo.js'>
				   					<img class='img' src="../resources/img/folder_64.png">Credit Memo
				   				</div>
				   				
				   				
		                    </div>
		                    <div class='withsubmenu' id='reports-section'><img class='img' src="../resources/icons/main-report.png">Reports
		                    	


		                    </div>
				   			<div class="submenu">
				   				
				   			
				   				
				   				
				   				
		                    </div>
				   		</div>
				   		<div class='text-center' id='poweredby'><span class='systembrand' style="font-size: 9px; font-weight: 600;">ACCOUNTING SYSTEM</span><br>Designed and Developed by<br><a href="">Turningpoint Inc.</a></div>
				   	</div>
			   </div>

			   


			   <!-- ************************************END SIDEBAR NAV ****************************************************************** -->





			   <!-- ************************************************ HEADER ******************************************** -->
			   <div class="topheader">
			   			<div class='user-header hidden-xs hidden-sm' >
			   				<div class="user-header-inner" >
				   				<i class="fa fa-user fa-2x" style='padding-right:5px; font-size:1.3em'></i>
				   				<span>
				   				Welcome, 
				   				<span class='account-settings-link pointer' data-title='User Settings' data-js='user-settings.js' data-file='user-settings.php' id='usersettings' title='User Settings'><?php echo ucwords(strtolower(@$_SESSION['fnameWMS'])); ?>
				   				</span>!&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<?php echo date('l, F d, Y') ?>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				   				<span class='pointer kainos-wms-about-link' data-toggle='modal' href='#systemaboutmodal'>About</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				   				<a class='signout' href="logout.php">
				   					<i class="fa fa-sign-out fa-2x" style='padding-right:5px; font-size:1.2em'></i>Logout
				   				</a>
				   				</span>
				   			</div>	   				
			   			</div>
			   </div>

			   

			   <!-- ************************************************ HEADER ******************************************** -->





			   <!-- ******************************************* CONTENT ****************************************************************-->

				<div class='content' id='content' style='overflow:auto;'>
					<div class="content-tab-pane">
						<div class="content-tabs-wrapper">
							<ul class='content-tabs'>

							</ul>
						</div>
						<div class='content-pane-wrapper'>
						</div>
					</div>

				</div>

			   <!-- ************************************ END OF CONTENT ********************************************************************-->

			   	<div class="modal fade" id="systemaboutmodal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div class='page-title'>
									About
									<button class="close" data-dismiss="modal">&times;</button>
								</div>
							</div>
							<div class="modal-body">
									<div class="col-sm-4">
										<img src="../resources/logo.png" class='img-responsive'><br>
									</div>
									<div class="col-sm-8">
										<span style='font-size:18px'>ACCOUNTING SYSTEM</span><br>
										Version 1.1.0 (For Windows) <br>
										Developed by <a href="http://tpincorporated.com">Turningpoint Incorporated</a>.<br>
										Copyright &copy; <?php echo date('Y'); ?>. All Rights Reserved.


										<br></br>
										This software is protected by copyright law. Unauthorized reproduction or
										distribution of this application, or any portion of it, may result in severe
										civil and criminal penalties, and will be prosecuted to the maximum extent possible
										under law.

									</div>
							</div>
							<div class="modal-footer">
								<br>
							</div>
						</div>
					</div>  
				</div>





				<div class="modal fade" id="fieldeditmodal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-header">
								<div class='page-title'>
									<span class='fieldeditmodal-title'></span>
									<button class="close" data-dismiss="modal">&times;</button>
								</div>
							</div>
							<div class="modal-body">
								<div class='form-horizontal'>
										<input type='hidden' class='fieldeditmodal-table'>
										<input type='hidden' class='fieldeditmodal-column'>
										<input type='hidden' class='fieldeditmodal-txncolumn'>
										<input type='hidden' class='fieldeditmodal-txnnumber'>
										<input type='hidden' class='fieldeditmodal-type'>
										<input type='hidden' class='fieldeditmodal-id'>
										<input type='hidden' class='fieldeditmodal-code'>
									
										<div class='modal-errordiv'></div>
										<div class="form-group">
											<div class='col-md-12'>
										    	<label class='control-label'>Old Value</label>
										        <input type='text' class='form-input form-control fieldeditmodal-oldvalue' disabled="">
										    </div>
										</div>
										<div class="form-group">
											<div class='col-md-12'>
										    	<label class='control-label'>New Value</label>
										        <input type='text' class='form-input form-control fieldeditmodal-newvalue'>
										    </div>
										        
										</div>
								</div>
							</div>
							<div class="modal-footer">
								<div class="text-center">
									<button class='btn btn-blue2 mybtn' id='fieldeditmodal-savebtn'>Save</button>
									<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
								</div>
							</div>
						</div>
					</div>  
				</div>

		





		<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->

		<script src="../js/jquery-1.11.3.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/jsfunctions.js"></script>

		<script src="../resources/BootstrapNotification/bootstrap-notify.min.js"></script>

		<script type="text/javascript" src="../resources/dialog/jquery-confirm.js"></script> 	

		<script type="text/javascript" src="../resources/datepicker/jquery-ui.js"></script>
		<script type="text/javascript" src="../resources/jquery-interactions/jquery-ui2.js"></script>

		<!--<script src="../resources/tags/dist/bootstrap-tagsinput.min.js"></script>
		<script src="../resources/tags/examples/assets/app.js"></script>-->

		<!-- DATATABLES -->
		<script type="text/javascript" src="../resources/datatables/media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="../resources/datatables/media/js/dataTables.bootstrap.js"></script>

		<!-- MY CUSTOM SCRIPTS -->
		<script type="text/javascript" src='../js/custom.js'></script>	
		<script type="text/javascript" src='../js/main.js'></script>

		<!-- FOR DROPDOWN -->
		<script src="../resources/select/dist/js/select2.js"></script>
		
		<!-- PRICE FIELD FORMAT -->
		<script type="text/javascript" src="../resources/priceformat2/jquery.number.js"></script>


		<!-- FLEXIGRID -->
		<script type="text/javascript" src="../resources/flexigrid/js/flexigrid.js"></script>

		<!-- COLOR PICKER -->
		<script type="text/javascript" src="../resources/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.js"></script>


		<script type="text/javascript" src="../resources/resizecolumn/dist/jquery.resizableColumns.js"></script>

		<script type="text/javascript" src="../resources/timepicker-addon/src/jquery-ui-timepicker-addon.js"></script>


		<!-- TOGGLE -->
		<script src="../js/bootstrap-toggle.js"></script>

		<!-- TAGS -->
		<script type="text/javascript" src="../resources/tags/bootstrap-tagsinput.js"></script>

		<!-- BOOTSTRAP TABLE -->
		<script src="../resources/bootstrap-table/dist/bootstrap-table.js"></script>

		<!-- TREE -->
		<script src="../resources/jstree/dist/jstree.js"></script>

		


		<!-- GRAPHS -->
		<!--<script type="text/javascript" src="../resources/chartist/chartist.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>-->
		





		<script type="text/javascript">
			$(document).ready(function(){
				setTimeout(function(){
					$('#loading-img').addClass('hidden');
				},500);
				
				
				var windowHeight = $(window).height()-51;
				$('.content').css("height",windowHeight);
				$('.sidebar-panel').css("height",$(window).height()-20);
				$(window).resize(function(){
					$('.content').css({height:$(window).height()-51});
					$('.sidebar-panel').css({height:$(window).height()-20});

				});

				userAccess();
				userAccessMobile();

				var viewtobeloaded  = <?php echo json_encode($viewtobeloaded) ?>;
				viewtobeloaded = viewtobeloaded.trim();


				if(viewtobeloaded==''){
					$.post("../scripts/main.php",{checkDashboardAccess:'sd$oihBO$h#OiB@s09#j!@IO#09aujj$Oi03n'},function(data){

						if(data.trim()=='true'){
							$('.content>.content-tab-pane .content-tabs').append("<li data-pane='#dashtabpane' class='active'>Dashboard<i class='fa fa-remove'></i></li>");
							$('.content>.content-tab-pane .content-pane-wrapper').append("<div class='content-pane active' id='dashtabpane'></div>");
							$('.content>.content-tab-pane .content-pane-wrapper>.content-pane:last-child').load('dashboard.php');
							$.getScript(pagescripts+'dashboard.js');
						}
						else if(data.trim()!=''){
							alert(data);
						}
					});
				}



				/** BUTTON CLICK SOUND ***/
				var obj = document.createElement("audio"); 
				obj.src="../resources/click.mp3";
				obj.volume=1;
				obj.autoPlay=false;
				obj.preLoad=true;
				$(document).on("click",".soundclick, button:not('.disabled'), .button-group-btn:not('.disabled'),.nav-tabs>li,#sidebar-nav>.nosubmenu,#sidebar-nav>.withsubmenu,#sidebar-nav>.submenu>div, table.dataTable>thead>tr>th:not('.column-nosort'), #usersettings",function(){
			        obj.play();
				});
				/***************************/

					$(".withsubmenu").click(function(){
						var ht = .46*$(window).height();
						$(this).next('.submenu').css({maxHeight:ht});
					});



				/*var scale = 'scale(1)';
				document.body.style.webkitTransform =  scale;    // Chrome, Opera, Safari
 				document.body.style.msTransform =   scale;       // IE 9
 				document.body.style.transform = scale;  */
 				document.body.style.zoom = screen.logicalXDPI / screen.deviceXDPI;


			});

		</script>






		


	</body>
</html>