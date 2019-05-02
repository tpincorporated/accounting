<?php
    include('../../config/connection.php');
    include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
    include("../../config/functions.php");
?>

<div class='header-page' >
	<div class='header-page-inner'>
		User Group
	</div>

</div>
<div class="container-fluid">
    <div class="pageContent noborder">

    	<table id='usergrouptable'>
			<tbody></tbody>

		</table>


	</div>
</div>


<div class="modal fade" id="addusergroupmodal">
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
					<button class='btn btn-blue2 mybtn usergroupmodal-savebtn' id='addusergroupmodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>

<div class="modal fade" id="editusergroupmodal">
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
							<input type='hidden' class='usergroupmodalid'>
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
					<button class='btn btn-blue2 mybtn usergroupmodal-savebtn' id='editusergroupmodal-savebtn'>Save</button>
					<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
				</div>
			</div>
		</div>
	</div>  
</div>

<div class="modal fade" id="editusergrouppermissionsmodal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					User Group Permission
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
				

				<div class="pane-content" style='height: 400px;  overflow: auto; background-color:#fff'>

					<input type='hidden' id='usergrouppermissionid'>
					<div class="usergroupaccesssection" style='padding:10px'>
						<?php include('../loadables/ajax/list-of-permissions.php'); ?>
					</div>


				</div>

			</div>
			<div class="modal-footer">
								<div class="text-center">
									<button class='btn btn-blue2 mybtn user-modal-savebtn' id='usergrouppermission-savebtn'>Save</button>
									<button class='btn btn-blue2 mybtn modal-cancelbtn'>Cancel</button>
								</div>
			</div>
		</div>
	</div>  
</div>

<script type="text/javascript">
	$(document).ready(function(){

		var tabUSERGROUP = '#usergroup-menutabpane';
		$(tabUSERGROUP+' .modal-dialog').draggable();

		$(tabUSERGROUP+' .usergroupaccesssection').jstree({
				"checkbox" : {
			      //"keep_selected_style" : false,
			      //"two_state": true,
			      "cascade":'up'
			    },
				"plugins" : [ "checkbox" ]
		});


		

		$(tabUSERGROUP+" #usergrouptable").flexigrid({
				url: 'loadables/ajax/system.user-group.php',
				dataType: 'json',
				colModel : [
						{display: 'Actions', name : 'action', width : 100, sortable : false, align: 'center'},
						{display: 'System ID', name : 'id', width : 100, sortable : true, align: 'left'},
						{display: 'Code', name : 'code', width : 250, sortable : true, align: 'left'},
						{display: 'Description', name : 'description', width : 250, sortable : true, align: 'left'},
						{display: 'Created by', name : 'created_by', width : 200, sortable : true, align: 'left'},
						{display: 'Created Date', name : 'created_date', width : 200, sortable : true, align: 'left'},
						{display: 'Updated by', name : 'updated_by', width : 200, sortable : true, align: 'left'},
						{display: 'Updated Date', name : 'updated_date', width : 200, sortable : true, align: 'left'}
				],
				buttons : [
				        {separator: true},
						{name: 'Add', bclass: 'add addusergroupbtn', onpress : addusergroup},
						{name: 'Delete', bclass: 'delete deleteusergroupbtn', onpress : deleteusergroup}
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

		function addusergroup(){
				$('#addusergroupmodal').modal('show');
		}

		function deleteusergroup(){

		
			if(parseInt($('#usergrouptable .trSelected').length)>0){
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
							$('#usergrouptable .trSelected').each(function(){
								data.push($(this).attr('rowid'));
							});
							$.post('../scripts/user-group.php',{deleteSelectedRows:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',data:data},function(response){

								if(response.trim()=='success'){
									$('#usergrouptable').flexOptions({
											url:'loadables/ajax/system.user-group.php',
											sortname: "description",
											sortorder: "asc"
									}).flexReload(); 
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
				say("Please select row(s) to delete");
			}

				//$("#mytable").flexAddData(eval(array));
				//$('#mytable').flexOptions({url:'staff.php?name=user%200'}).flexReload(); 
				
		}
		
		userAccess();
			

		
	});
	
</script>