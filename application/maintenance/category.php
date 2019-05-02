<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		Category
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='categorytable'>
			<tbody></tbody>

		</table>


	</div>
</div>


<div class="modal fade" id="addcategorymodal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					New
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
					<div class="col-md-12">
						<form class="form-horizontal">
							<div class="form-group">
								<div class="errordiv"></div>
							</div>

							<div class="form-group">
								<label class='control-label'>Code*</label>
								<input type='text' class='form-input form-control code'>
								
							</div>	
							<div class="form-group">
								<label class='control-label'>Description*</label>
								<input type='text' class='form-input form-control description'>
								
							</div>		
						</form>
					</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button class='btn btn-blue2 mybtn categorymodal-savebtn' id='addcategorymodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>

<div class="modal fade" id="editcategorymodal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					Edit
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
					<div class="col-md-12">
						<form class="form-horizontal">
							<div class="form-group">
								<div class="errordiv"></div>
							</div>
							<input type='hidden' class='categorymodalid'>
							<div class="form-group">
								<label class='control-label'>Status*</label>
								<select class='form-input form-control statusflag select2'>
									<option value='1'>Active</option>
									<option value='0'>Inactive</option>
								</select>
								
							</div>
							<div class="form-group">
								<label class='control-label'>Code*</label>
								<input type='text' class='form-input form-control code'>
								
							</div>	
							<div class="form-group">
								<label class='control-label'>Description*</label>
								<input type='text' class='form-input form-control description'>
								
							</div>				
						</form>
					</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button class='btn btn-blue2 mybtn categorymodal-savebtn' id='editcategorymodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>


<script type="text/javascript">
	$(document).ready(function(){

		var contentVT = '#category-menutabpane';
		$(contentVT+' .select2').select2({
			width:'100%'
		});

		$(contentVT+' .modal-dialog').draggable();

		

		$(contentVT+" #categorytable").flexigrid({
				url: 'loadables/ajax/maintenance.category.php',
				dataType: 'json',
				colModel : [
						{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'System ID', name : 'id', width : 100, sortable : true, align: 'left'},
						{display: 'Code', name : 'code', width : 250, sortable : true, align: 'left'},
						{display: 'Description', name : 'description', width : 250, sortable : true, align: 'left'},
						{display: 'Active Flag', name : 'activeflag', width : 100, sortable : true, align: 'left'},
						{display: 'Created by', name : 'created_by', width : 200, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 200, sortable : true, align: 'left'},
						{display: 'Updated by', name : 'updated_by', width : 200, sortable : true, align: 'left'},
						{display: 'Updated Date', name : 'updated_date', width : 200, sortable : true, align: 'left'}
				],
				buttons : [
				        {separator: true},
						{name: 'Add', bclass: 'add addcategorybtn', onpress : addcategory},
						{name: 'Delete', bclass: 'delete deletecategorybtn', onpress : deletecategory}
				],
				searchitems : [
						{display: 'Code', name : 'code', isdefault: true},
						{display: 'Description', name : 'description'},
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

		function addcategory(){
				$(contentVT+' #addcategorymodal').modal('show');
		}

		function deletecategory(){

		
			if(parseInt($(contentVT+' #categorytable .trSelected').length)>0){
				$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Confirmation',
					content: 'Delete selected row(s)?',
					confirmButton: 'Delete',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							var data = [];
							$(contentVT+' #categorytable .trSelected').each(function(){
								data.push($(this).attr('rowid'));
							});
							$.post('../scripts/category.php',{deleteSelectedRows:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',data:data},function(response){

								if(response.trim()=='success'){
									$(contentVT+' #categorytable').flexOptions({
											url:'loadables/ajax/maintenance.category.php',
											sortname: "description",
											sortorder: "asc"
									}).flexReload(); 
								}
								else if(response.trim()=='nodeletepermission'){
									say("Access denied. No permission to delete.");
									$(contentVT+' #categorytable').flexOptions({
											url:'loadables/ajax/maintenance.category.php',
											sortname: "description",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
								}

							});
					},
					cancel:function(){

					}
				});
			}
			else{
				say("Please select row(s) to be deleted");
			}

				//$("#mytable").flexAddData(eval(array));
				//$('#mytable').flexOptions({url:'staff.php?name=user%200'}).flexReload(); 
				
		}
		
		userAccess();
			

		
	});
	
</script>