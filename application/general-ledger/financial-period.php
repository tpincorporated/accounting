<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		Financial Period
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='financialyeartable'>
			<tbody></tbody>

		</table>
		<br>
		<table id='accountingperiodtable'>
			<tbody></tbody>

		</table>


	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){

		var tabFinancialPeriod = "#financialperiod-menutabpane";

		

		$(tabFinancialPeriod+" #financialyeartable").flexigrid({
				url: 'loadables/ajax/general-ledger.financial-year.php',
				dataType: 'json',
				colModel : [
						//{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'Active', name : 'activeflag', width : 50, sortable : true, align: 'center'},
						{display: 'Closed', name : 'closedflag', width : 50, sortable : true, align: 'center'},
						{display: 'Year', name : 'year', width : 150, sortable : true, align: 'right'},
						//{display: 'Created by', name : 'created_by', width : 200, sortable : true, align: 'left'},
						//{display: 'Created Date', name : 'created_date', width : 200, sortable : true, align: 'left'},
						{display: 'Updated by', name : 'updated_by', width : 250, sortable : true, align: 'left'},
						{display: 'Updated Date', name : 'updated_date', width : 250, sortable : true, align: 'left'}
				],
				buttons : [
						{name: 'Activate', bclass: 'add addcarrierbtn', onpress : ''},
						/*{separator: true},
						{name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
				],
				searchitems : [
						{display: 'Year', name : 'year', isdefault: true},
						{display: 'Updated by', name : 'updatedby'}
				],
				sortname: "year",
				sortorder: "asc",
				usepager: true,
				title: "Financial Year",
				useRp: true,
				rp: 15, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 200,
				singleSelect: false
		});

		$(tabFinancialPeriod+" #accountingperiodtable").flexigrid({
				url: 'loadables/ajax/general-ledger.accounting-period.php',
				dataType: 'json',
				colModel : [
						//{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'Active', name : 'activeflag', width : 50, sortable : true, align: 'center'},
						{display: 'Closed', name : 'closedflag', width : 50, sortable : true, align: 'center'},
						{display: 'Month', name : 'month', width : 150, sortable : true, align: 'right'},
						//{display: 'Created by', name : 'created_by', width : 200, sortable : true, align: 'left'},
						//{display: 'Created Date', name : 'created_date', width : 200, sortable : true, align: 'left'},
						{display: 'Updated by', name : 'updated_by', width : 250, sortable : true, align: 'left'},
						{display: 'Updated Date', name : 'updated_date', width : 250, sortable : true, align: 'left'}
				],
				buttons : [
						/*{name: 'Add', bclass: 'add addcarrierbtn', onpress : addCarrier},
						{separator: true},
						{name: 'Delete', bclass: 'delete deletecarrierbtn', onpress : deleteCarrier}*/
				],
				searchitems : [
						{display: 'Month', name : 'month', isdefault: true},
						{display: 'Updated by', name : 'updatedby'}
				],
				sortname: "month",
				sortorder: "asc",
				usepager: true,
				title: "Accounting Period",
				useRp: true,
				rp: 15, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 250,
				singleSelect: false
		});

		

		
		userAccess();
			

		
	});
	
</script>