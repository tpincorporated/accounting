<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		System Log
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent noborder">
	    			<table id='systemlogtable'>
	    				
	    				<tbody>
	    					
	    				</tbody>
	    			</table>
	    			
    			

	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
			var contentLOG = '#systemlog-menutabpane';
			$(contentLOG+' .modal-dialog').draggable();
			userAccess();
			////////////////// DATATABLES //////////////////////////////
			$(contentLOG+" #systemlogtable").flexigrid({
				url: 'loadables/ajax/system.system-log.php',
				dataType: 'json',
				colModel : [
						{display: 'System ID', name : 'id', width : 100, sortable : true, align: 'left'},
						{display: 'Module', name : 'module', width : 250, sortable : true, align: 'left'},
						{display: 'Description', name : 'description', width : 250, sortable : true, align: 'left'},
						{display: 'Query', name : 'query', width : 450, sortable : false, align: 'left'},
						{display: 'Created by', name : 'created_by', width : 250, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 250, sortable : true, align: 'left'}

				],
				buttons : [
				        {separator: true},
						{name: 'Download', bclass: 'download', onpress : downloadSystemLog}
						/*{name: 'Delete', bclass: 'delete', onpress : deleteUserGroup}*/
				],
				searchitems : [
						{display: 'Module', name : 'module', isdefault: true},
						{display: 'Description', name : 'description'},
						{display: 'Query', name : 'query'}
				],
				sortname: "id",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 15, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				//width: 800,
				height: 500,
				singleSelect: false,
				disableSelect: true
		});

		function downloadSystemLog(){
			var downloadlog = window.open("Printouts/excel/download-system-log.php");
		}
			
	});	
		
</script>