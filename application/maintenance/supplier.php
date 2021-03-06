<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		Supplier
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='suppliertable'>
			<tbody></tbody>

		</table>


	</div>
</div>


<div class="modal fade" id="addsuppliermodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					New
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
						<form class="form-horizontal">
							<div class='col-md-12'>
								<div class="form-group">
									<div class="errordiv"></div>
								</div>
							</div>
							<div class='col-md-8'>
							    <div class='col-md-12'>
									<div class="form-group">
										<label class='control-label'>Code*</label>
										<input type='text' class='form-input form-control code'>
										
									</div>
									<div class="form-group">
										<label class='control-label'>Description*</label>
										<input type='text' class='form-input form-control description'>
									</div>	
									<div class="form-group">
										<label class='control-label'>Supplier Group*</label>
										<select class='form-input form-control suppliergroup suppliergroupdropdownselect'>
										</select>
									</div>	
									<div class="form-group">
										<label class='control-label'>Default Terms*</label>
										<select class='form-input form-control defaultterms termsdropdownselect'>
										</select>
									</div>	
								</div>
							</div>

							<div class='col-md-4'>
								<div class='col-md-12'>
									<div class="form-group">
										<label class='control-label'>Fax</label>
										<input type='text' class='form-input form-control fax'>
										
									</div>
									<div class="form-group">
										<label class='control-label'>Telephone</label>
										<input type='text' class='form-input form-control telephone'>
										
									</div>	
									<div class="form-group">
										<label class='control-label'>Mobile</label>
										<input type='text' class='form-input form-control mobile'>
										
									</div>	
									<div class="form-group">
										<label class='control-label'>Email</label>
										<input type='text' class='form-input form-control email'>
										
									</div>		
								</div>
							</div>		
						</form>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button class='btn btn-blue2 mybtn suppliermodal-savebtn' id='addsuppliermodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>

<div class="modal fade" id="editsuppliermodal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					Edit
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
						<form class="form-horizontal">
							<div class='col-md-12'>

								<div class="form-group">
									<div class="errordiv"></div>
								</div>
							</div>
							<input type='hidden' class='suppliermodalid'>

							<div class='col-md-8'>
							    <div class='col-md-12'>
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
									<div class="form-group">
										<label class='control-label'>Supplier Group*</label>
										<select class='form-input form-control suppliergroup suppliergroupdropdownselect'>
										</select>
									</div>	
									<div class="form-group">
										<label class='control-label'>Default Terms*</label>
										<select class='form-input form-control defaultterms termsdropdownselect'>
										</select>
									</div>	
								</div>
							</div>

							<div class='col-md-4'>
								<div class='col-md-12'>
									<div class="form-group">
										<label class='control-label'>Fax</label>
										<input type='text' class='form-input form-control fax'>
										
									</div>
									<div class="form-group">
										<label class='control-label'>Telephone</label>
										<input type='text' class='form-input form-control telephone'>
										
									</div>	
									<div class="form-group">
										<label class='control-label'>Mobile</label>
										<input type='text' class='form-input form-control mobile'>
										
									</div>	
									<div class="form-group">
										<label class='control-label'>Email</label>
										<input type='text' class='form-input form-control email'>
										
									</div>	
								</div>
							</div>		
							
							
						</form>
					
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<button class='btn btn-blue2 mybtn suppliermodal-savebtn' id='editsuppliermodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>


<div class="modal fade" id="viewsupplieraddressmodal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    Supplier Address - <span class='viewsupplieraddressmodal-suppliername'></span>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
            	<div class='col-md-12'>
            		<div class='form-horizontal supplieraddaddressgroupwrapper'>
            			<input type='hidden' class='viewsupplieraddressmodal-shipperid'>
            			<div class='col-md-12'>
            				<div class='modal-errordiv'></div>
            			</div>
            			<div class='col-md-7'>
	            			

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Street*</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control street inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>District/Barangay</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control district inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>City</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control city inputtxtfld'>
	            				</div>
	            			</div>

	            			

	            		</div>
	            		<div class='col-md-5'>
	            			
	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Region/Province</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control region inputtxtfld'>

	            				</div>
	            			</div>
	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Zip Code</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control zipcode inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Country</label>
	            				<div class='col-md-9'>
	            					<select class='form-control countriesdropdownselect country inputslctfld'></select>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'></label>
	            				<div class='col-md-9'>
	            					<div class='smallbuttons-wrapper'>
	            					<button class='btn mybtn viewsupplieraddressmodal-addbtn datatablebtn'>
	            							<i class='fa fa-xs fa-plus'></i>Add
	            						</button>
	            						<button class='btn mybtn viewsupplieraddressmodal-clearbtn datatablebtn'>
	            							<i class='fa fa-xs fa-refresh'></i>Clear
	            						</button>
	            					</div>
	            				</div>
	            			</div>
	            			<br>
	            		</div>
            		</div>

	            	
				</div>
				<div class='col-md-12'>
					<table id='viewsupplieraddressmodal-tbl'>
						<tbody></tbody>
					</table>
				</div>
           	</div>
        </div>
    </div>
</div>

<div class="modal fade" id="viewsuppliercontactmodal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class='page-title'>
                    Supplier Contact - <span class='viewsuppliercontactmodal-suppliername'></span>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
            </div>
            <div class="modal-body">
            	<div class='col-md-12'>
            		<div class='form-horizontal suppliercontactgroupwrapper'>
            			<input type='hidden' class='viewsuppliercontactmodal-shipperid'>
            			<div class='col-md-12'>
            				<div class='modal-errordiv'></div>
            			</div>
            			<div class='col-md-7'>
	            			

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Name*</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control name inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Position</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control position inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Mobile</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control mobile inputtxtfld'>
	            				</div>
	            			</div>

	            			

	            		</div>
	            		<div class='col-md-5'>
	            			
	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Telephone</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control telephone inputtxtfld'>

	            				</div>
	            			</div>
	            			<div class="form-group">
	            				<label class='control-label col-md-3'>Email</label>
	            				<div class='col-md-9'>
	            					<input type='text' class='form-input form-control email inputtxtfld'>
	            				</div>
	            			</div>

	            			<div class="form-group">
	            				<label class='control-label col-md-3'></label>
	            				<div class='col-md-9'>
	            					<div class='smallbuttons-wrapper'>
	            					<button class='btn mybtn viewsuppliercontactmodal-addbtn datatablebtn'>
	            							<i class='fa fa-xs fa-plus'></i>Add
	            						</button>
	            						<button class='btn mybtn viewsuppliercontactmodal-clearbtn datatablebtn'>
	            							<i class='fa fa-xs fa-refresh'></i>Clear
	            						</button>
	            					</div>
	            				</div>
	            			</div>
	            			<br>
	            		</div>
            		</div>

	            	
				</div>
				<div class='col-md-12'>
					<table id='viewsuppliercontactmodal-tbl'>
						<tbody></tbody>
					</table>
				</div>
           	</div>
        </div>
    </div>
</div>


<script type="text/javascript">
	$(document).ready(function(){

		var contentSPPLR = '#supplier-menutabpane';
		$(contentSPPLR+' .select2').select2({
			width:'100%'
		});

		//$(contentSPPLR+' .modal-dialog').draggable();

		$(contentSPPLR+" .countriesdropdownselect").select2({
	            ajax: {
	                    url: "loadables/dropdown/country.php",
	                    dataType: 'json',
	                    delay: 100,
	                    data: function (params) {
	                        return {
	                            q: params.term // search term
	                        };
	                    },
	                    processResults: function (data) {
	                        // parse the results into the format expected by Select2.
	                        // since we are using custom formatting functions we do not need to
	                        // alter the remote JSON data
	                        return {
	                            results: data
	                        };
	                    },
	                    cache: true
	                },
	                minimumInputLength: 0,
	                width:'100%'
	    });

		$(contentSPPLR+" .suppliergroupdropdownselect").select2({
		            ajax: {
		                    url: "loadables/dropdown/supplier-group.php",
		                    dataType: 'json',
		                    delay: 100,
		                    data: function (params) {
		                        return {
		                            q: params.term // search term
		                        };
		                    },
		                    processResults: function (data) {
		                        // parse the results into the format expected by Select2.
		                        // since we are using custom formatting functions we do not need to
		                        // alter the remote JSON data
		                        return {
		                            results: data
		                        };
		                    },
		                    cache: true
		                },
		                minimumInputLength: 0,
		                width:'100%'
		});

		$(contentSPPLR+" .termsdropdownselect").select2({
		            ajax: {
		                    url: "loadables/dropdown/terms.php",
		                    dataType: 'json',
		                    delay: 100,
		                    data: function (params) {
		                        return {
		                            q: params.term // search term
		                        };
		                    },
		                    processResults: function (data) {
		                        // parse the results into the format expected by Select2.
		                        // since we are using custom formatting functions we do not need to
		                        // alter the remote JSON data
		                        return {
		                            results: data
		                        };
		                    },
		                    cache: true
		                },
		                minimumInputLength: 0,
		                width:'100%'
		});

		

		$(contentSPPLR+" #suppliertable").flexigrid({
				url: 'loadables/ajax/maintenance.supplier.php',
				dataType: 'json',
				colModel : [
						{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'System ID', name : 'id', width : 100, sortable : true, align: 'left'},
						{display: 'Code', name : 'code', width : 250, sortable : true, align: 'left'},
						{display: 'Description', name : 'description', width : 250, sortable : true, align: 'left'},
						{display: 'Active Flag', name : 'activeflag', width : 100, sortable : true, align: 'left'},
						{display: 'Supplier Group', name : 'suppliergroup', width : 250, sortable : true, align: 'left'},
						{display: 'Created by', name : 'created_by', width : 200, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 200, sortable : true, align: 'left'},
						{display: 'Updated by', name : 'updated_by', width : 200, sortable : true, align: 'left'},
						{display: 'Updated Date', name : 'updated_date', width : 200, sortable : true, align: 'left'}
				],
				buttons : [
				        {separator: true},
						{name: 'Add', bclass: 'add addsupplierbtn', onpress : addsupplier},
						{name: 'Delete', bclass: 'delete deletesupplierbtn', onpress : deletesupplier}
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


		$(contentSPPLR+" #viewsupplieraddressmodal-tbl").flexigrid({
				url: 'loadables/ajax/maintenance.supplier-address.php',
				dataType: 'json',
				colModel : [
						{display: '', name : 'checkbox', width : 50, sortable : false, align: 'center'},
						{display: 'Action', name : 'action', width : 80, sortable : false, align: 'center'},
						{display: 'Active Flag', name : 'active_flag', width : 100, sortable : true, align: 'left'},
						{display: 'Default', name : 'default_flag', width : 100, sortable : true, align: 'left'},
						{display: 'Street', name : 'street', width : 250, sortable : true, align: 'left'},
						{display: 'District', name : 'district', width : 150, sortable : true, align: 'left'},
						{display: 'City', name : 'city', width : 150, sortable : true, align: 'left'},
						{display: 'Region/Province', name : 'region', width : 150, sortable : true, align: 'left'},
						{display: 'Zip Code', name : 'zip_code', width : 150, sortable : true, align: 'left'},
						{display: 'Country', name : 'country', width : 150, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Created By', name : 'createdby', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Updated Date', name : 'updated_date', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Updated By', name : 'updatedby', width : 150, sortable : true, align: 'left', hide: true}
				],
				buttons : [
				        {separator: true},
						{name: 'Select All', bclass: 'select1', onpress : spplrSelectAllAddress},
						{name: 'Deselect All', bclass: 'deselect1', onpress : spplrDeSelectAllAddress},
						{name: 'Delete', bclass: 'delete deletesupplieraddressbtn', onpress : deletesupplieraddress}
						
				],
				searchitems : [
						{display: 'Street', name : 'street', isdefault: true},
						{display: 'District', name : 'district'},
						{display: 'City', name : 'city'},
						{display: 'Region/Province', name : 'region'},
						{display: 'Zip Code', name : 'zip_code'},
						{display: 'Country', name : 'country'}
				],
				sortname: "default_flag",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				disableSelect: true,
				//width: 800,
				height: 350,
				singleSelect: false
		});

		$(contentSPPLR+" #viewsuppliercontactmodal-tbl").flexigrid({
				url: 'loadables/ajax/maintenance.supplier-contact.php',
				dataType: 'json',
				colModel : [
						{display: '', name : 'checkbox', width : 50, sortable : false, align: 'center'},
						{display: 'Action', name : 'action', width : 80, sortable : false, align: 'center'},
						{display: 'Active Flag', name : 'active_flag', width : 100, sortable : true, align: 'left'},
						{display: 'Default', name : 'default_flag', width : 100, sortable : true, align: 'left'},
						{display: 'Name', name : 'name', width : 250, sortable : true, align: 'left'},
						{display: 'Position', name : 'position', width : 150, sortable : true, align: 'left'},
						{display: 'Mobile', name : 'mobile', width : 150, sortable : true, align: 'left'},
						{display: 'Telephone', name : 'telephone', width : 150, sortable : true, align: 'left'},
						{display: 'Email', name : 'email', width : 150, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Created By', name : 'createdby', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Updated Date', name : 'updated_date', width : 150, sortable : true, align: 'left', hide: true},
						{display: 'Updated By', name : 'updatedby', width : 150, sortable : true, align: 'left', hide: true}
				],
				buttons : [
				        {separator: true},
						{name: 'Select All', bclass: 'select1', onpress : spplrSelectAllContact},
						{name: 'Deselect All', bclass: 'deselect1', onpress : spplrDeSelectAllContact},
						{name: 'Delete', bclass: 'delete deletesuppliercontactbtn', onpress : deletesuppliercontact}
						
				],
				searchitems : [
						{display: 'Name', name : 'name', isdefault: true},
						{display: 'Position', name : 'position'}
				],
				sortname: "default_flag",
				sortorder: "desc",
				usepager: true,
				title: "",
				useRp: true,
				rp: 10, //rows per page
				showTableToggleBtn: false,
				resizable: false,
				disableSelect: true,
				//width: 800,
				height: 350,
				singleSelect: false
		});

		function addsupplier(){
				$(contentSPPLR+' #addsuppliermodal').modal('show');
		}

		function deletesupplier(){

		
			if(parseInt($(contentSPPLR+' #suppliertable .trSelected').length)>0){
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
							$(contentSPPLR+' #suppliertable .trSelected').each(function(){
								data.push($(this).attr('rowid'));
							});
							$.post('../scripts/supplier.php',{deleteSelectedRows:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',data:data},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #suppliertable').flexOptions({
											url:'loadables/ajax/maintenance.supplier.php',
											sortname: "description",
											sortorder: "asc"
									}).flexReload(); 
								}
								else if(response.trim()=='nodeletepermission'){
									say("Access denied. No permission to delete.");
									$(contentSPPLR+' #suppliertable').flexOptions({
											url:'loadables/ajax/maintenance.supplier.php',
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

		function deletesupplieraddress(){

		
			if(parseInt($(contentSPPLR+' #viewsupplieraddressmodal-tbl .supplieraddressrowcheckbox:checked').length)>0){
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
							var supplierid = $(contentSPPLR+' .viewsupplieraddressmodal-shipperid').val();
							$(contentSPPLR+' #viewsupplieraddressmodal-tbl .supplieraddressrowcheckbox:checked').each(function(){
								data.push($(this).attr('rowid'));
							});
							//alert(data);
							$.post('../scripts/supplier.php',{deleteSelectedAddressRows:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',data:data},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "street",
											sortorder: "asc"
									}).flexReload(); 
								}
								else if(response.trim()=='nodeletepermission'){
									say("Access denied. No permission to delete.");
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "street",
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

				
		}

		function deletesuppliercontact(){

		
			if(parseInt($(contentSPPLR+' #viewsuppliercontactmodal-tbl .suppliercontactrowcheckbox:checked').length)>0){
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
							var supplierid = $(contentSPPLR+' .viewsuppliercontactmodal-shipperid').val();
							$(contentSPPLR+' #viewsuppliercontactmodal-tbl .suppliercontactrowcheckbox:checked').each(function(){
								data.push($(this).attr('rowid'));
							});
							//alert(data);
							$.post('../scripts/supplier.php',{deleteSelectedContactRows:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',data:data},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "default_flag",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nodeletepermission'){
									say("Access denied. No permission to delete.");
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "name",
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

				
		}


		function spplrSelectAllAddress(){
	    	$(contentSPPLR+' .supplieraddressrowcheckbox').prop('checked',true);
	    }
	    function spplrDeSelectAllAddress(){
	    	$(contentSPPLR+' .supplieraddressrowcheckbox').prop('checked',false);
	    }

	    function spplrSelectAllContact(){
	    	$(contentSPPLR+' .suppliercontactrowcheckbox').prop('checked',true);
	    }
	    function spplrDeSelectAllContact(){
	    	$(contentSPPLR+' .suppliercontactrowcheckbox').prop('checked',false);
	    }
		
		userAccess();
			

		
	});
	
</script>