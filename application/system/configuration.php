<?php
	include("../../config/connection.php");
	include("../../config/checkurlaccess.php");
	include("../../config/checklogin.php");
	include("../../config/functions.php");
?>
<div class='header-page' >
	<div class='header-page-inner'>
		Configuration
	</div>
</div>
<div class="container-fluid">
    <div class="pageContent">
			<div class='panel panel-primary mypanel'>
				<div class="panel-body">
					<div class="table-wrapper">
						<table class='table mytable table-striped table-condensed gray-template table-font-sm'  id='rcv-summary'>
							<thead>
								<tr>
									<th></th>
									<th>SETTINGS</th>
									<th class='text-center'>ACTION</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>
										Email Notification
									</td>
									<td class='text-center'>
										<button class='btn btn-blue2 mybtn btn-xs' id='editemailsettingsbtn'>
											<i class='fa fa-edit fa-lg fa-space'></i>Edit
										</button>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										Company Information
									</td>
									<td class='text-center'>
										<button class='btn btn-blue2 mybtn btn-xs' id='editcompanyinformationsettingsbtn'>
											<i class='fa fa-edit fa-lg fa-space'></i>Edit
										</button>
									</td>
								</tr>
							
								
							</tbody>							
						</table>	
					</div>
				</div>
			</div>
	</div>
</div>
<div class="modal fade" id="email-notification-settings">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					Email Notification
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-md-4">
					<div class='modal-body-info'>
						<span class='title'>Email Setup</span><br>
						Please provide the following information to setup email notification.
					</div>
				</div>
				<div class="col-md-8">
					
					<form class='form-horizontal'>
						<div class="form-group">
							<div class="errordiv"></div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Notification</label>
							<div class="col-md-8">
								<input type="checkbox" class='togglebutton activeflag'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Host</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control host requiredinputfield'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">TCP Port</label>
							<div class="col-md-8">
								<input type='number' class='form-input form-control tcpport requiredinputfield'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">TLS Encryption</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control encryption'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">SMTP Authentication</label>
							<div class="col-md-8">
								<select class='form-control smtpauthenticationflag requiredinputfield'>
									<option value='1'>Yes</option>
									<option value='0'>No</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">SMTP Username</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control smtpusername requiredinputfield'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">SMTP Password</label>
							<div class="col-md-8">
								<input type='password' class='form-input form-control smtppassword requiredinputfield'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Email Sender</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control emailsender requiredinputfield'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Email Sent From</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control emailsentfrom requiredinputfield'>
							</div>
						</div>

					</form>
				</div>                                              
			</div>
			<div class="modal-footer">
								<div class="text-center">
									<button class='btn btn-blue2 mybtn' id='emailnotification-savebtn'>Save</button>
									<button class='btn btn-blue2 mybtn modal-cancelbtn' id='emailnotification-cancelbtn'>Cancel</button>
								</div>
			</div>
		</div>
	</div>  
</div>



<div class="modal fade" id="company-information-settings">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class='page-title'>
					Company Information
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="col-md-4">
					<div class='modal-body-info'>
						<span class='title'>Company Details</span><br>
						Please provide the following information to setup company details.
					</div>
				</div>
				<div class="col-md-8">
					<!--<?php
									$rs = query("select * from company_information where id='1'");
									$name = '';
									$addr = '';
									$city='';
									$state='';
									$postal = '';
									$country = '';
									$primary ='';
									$secondary ='';
									$tin='';
									while($obj=fetch($rs)){
										$name = $obj->company_name;
										$addr = $obj->company_address;
										$city = $obj->city;
										$state = $obj->state_province;
										$postal = $obj->postal_code;
										$country = $obj->country;
										$primary = $obj->primary_color;
										$secondary = $obj->secondary_color;
										$tin= $obj->tax_identification_number;
									}
					?> -->
					<form class='form-horizontal'>
						<div class="form-group">
							<div class="errordiv"></div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Company Name</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control companyname'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Tax Identification Number</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control companytin'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Address</label>
							<div class="col-md-8">
								<textarea class='form-control companyaddress'></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">City</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control city'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">State/Province</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control stateprovince'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Postal Code</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control postalcode'>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Country</label>
							<div class="col-md-8">
								<input type='text' class='form-input form-control country'>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Primary Color</label>
							<div class="col-md-8">
								<input type="text" class="form-control colorpicker primarycolor"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Secondary Color</label>
							<div class="col-md-8">
								<input type="text" class="form-control colorpicker secondarycolor"/>
							</div>
						</div>

					</form>
				</div>                                              
			</div>
			<div class="modal-footer">
								<div class="text-center">
									<button class='btn btn-blue2 mybtn' id='companyinformation-savebtn'>Save</button>
									<button class='btn btn-blue2 mybtn modal-cancelbtn' id='companyinformation-cancelbtn'>Cancel</button>
								</div>
			</div>
		</div>
	</div>  
</div>



<script type="text/javascript">
    $(document).ready(function(){
    	  var contentCONF = '#configuration-menutabpane';
	      $(contentCONF+' .colorpicker').colorpicker({
	      	format: 'rgb'
	      });
	      $(contentCONF+' .modal-dialog').draggable();

	      $(contentCONF+' .togglebutton').bootstrapToggle({
		      on: 'ON',
		      off: 'OFF',
		      size: 'mini',
		      width: '100px'
		  });
    });
	
</script>