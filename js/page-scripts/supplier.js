


var contentSPPLR = '#supplier-menutabpane';

$(document).off('click','.editsupplierbtn').on('click','.editsupplierbtn',function(){
	var modal = "#editsuppliermodal";
	var rowid = $(this).attr('rowid');
	$(modal+' .suppliermodalid').val(rowid);

	$.post(server+'supplier.php',{supplierGetInfo:'kjoI$H2oiaah3h0$09jDppo92po@k@',id:rowid},function(data){
		//alert(data);
		rsp = $.parseJSON(data);
		if(rsp['response']=='success'){
			$(modal+' .code').val(rsp['code']);
			$(modal+' .description').val(rsp['description']);
			$(modal+' .fax').val(rsp['fax']);
			$(modal+' .telephone').val(rsp['telephone']);
			$(modal+' .mobile').val(rsp['mobile']);
			$(modal+' .email').val(rsp['email']);
			$(modal+' .statusflag').val(rsp['statusflag']).trigger('change');


			if(rsp["suppliergroup"]!=null&&rsp["suppliergroupid"]>0){
				$(modal+" .suppliergroup").empty().append('<option selected value="'+rsp["suppliergroupid"]+'">'+rsp["suppliergroup"]+'</option>').trigger('change');
			}
			else{
				$(modal+" .suppliergroup").empty().trigger('change');
			}

			if(rsp["terms"]!=null&&rsp["termsid"]>0){
				$(modal+" .defaultterms").empty().append('<option selected value="'+rsp["termsid"]+'">'+rsp["terms"]+'</option>').trigger('change');
			}
			else{
				$(modal+" .defaultterms").empty().trigger('change');
			}
			
		}
		else{
			
			$(modal).modal('hide');
			$(modal).on('hidden.bs.modal',function(){
				$(modal).off('hidden.bs.modal');
				say('Unable to load data. Invalid ID.');
			});
		}
		
	});
});

/***************************** SAVE | EDIT **************************************************/
$(document).off('click','.suppliermodal-savebtn:not(".disabled")').on('click','.suppliermodal-savebtn:not(".disabled")',function(){
	var modal = '#'+$(this).closest('.modal').attr('id'),
		code = $(modal+' .code').val(),
		desc = $(modal+' .description').val(),
		suppliergroup = $(modal+' .suppliergroup').val(),
		terms = $(modal+' .defaultterms').val(),
		fax = $(modal+' .fax').val(),
		tel = $(modal+' .telephone').val(),
		mobile = $(modal+' .mobile').val(),
		email = $(modal+' .email').val(),
		statusflag = 1,
		id='',
		newsort = 'created_date',
		source='add',
		button=$(this);
		button.addClass('disabled').attr('disabled','disabled');

	if(modal=='#editsuppliermodal'){
		id = $(modal+' .suppliermodalid').val();
		statusflag = $(modal+' .statusflag').val();
		source = 'edit';
		newsort = 'updated_date';
	}


	if(suppliergroup==null||suppliergroup=='null'||suppliergroup=='NULL'||suppliergroup==''){
		suppliergroup = 'NULL';
	}
	if(terms==null||terms=='null'||terms=='NULL'||terms==''){
		terms = 'NULL';
	}
	

	if(code==''){
		$(modal+' .code').focus();
		$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Please provide a code.</div></div>");
		button.removeAttr('disabled').removeClass('disabled');
	}
	else if(desc==''){
		$(modal+' .description').focus();
		$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Please provide a description.</div></div>");
		button.removeAttr('disabled').removeClass('disabled');
	}
	else{
		$('#loading-img').removeClass('hidden');
		$.post(server+'supplier.php',{supplierSaveEdit:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',source:source,id:id,code:code,desc:desc,suppliergroup:suppliergroup,terms:terms,fax:fax,tel:tel,mobile:mobile,email:email,statusflag:statusflag},function(data){
				if(data.trim()=='success'){
					$(modal).modal('hide');
					$(modal).on('hidden.bs.modal',function(){
						
						$('#suppliertable').flexOptions({
											url:'loadables/ajax/maintenance.supplier.php',
											sortname: newsort,
											sortorder: "desc"
						}).flexReload(); 
						$('#loading-img').addClass('hidden');
						$(modal).off('hidden.bs.modal');
						button.removeAttr('disabled').removeClass('disabled');
						$(modal+' .code').val('');
						$(modal+' .description').val('');
						$(modal+' .fax').val('');
						$(modal+' .telephone').val('');
						$(modal+' .mobile').val('');
						$(modal+' .email').val('');
						$(modal+' .suppliergroup').empty().trigger('change');
						$(modal+' .defaultterms').empty().trigger('change');


					});
				}
				else if(data.trim()=='codeexists'){
					$('#loading-img').addClass('hidden');
					$(modal+' .code').focus();
					$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Code exists. Please provide another code.</div></div>");
					button.removeAttr('disabled').removeClass('disabled');
				}
				else if(data.trim()=='noaddpermission'){
					$('#loading-img').addClass('hidden');
					$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Access denied. No permission to add.</div></div>");
					button.removeAttr('disabled').removeClass('disabled');
					userAccess();
				}
				else if(data.trim()=='noeditpermission'){
					$('#loading-img').addClass('hidden');
					$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Access denied. No permission to edit.</div></div>");
					button.removeAttr('disabled').removeClass('disabled');
					userAccess();
				}
				else if(data.trim()=='sourceundefined'){
					$('#loading-img').addClass('hidden');
					$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Source undefined. Please refresh page.</div></div>");
					button.removeAttr('disabled').removeClass('disabled');
					userAccess();
				}
				else{
					$('#loading-img').addClass('hidden');
					alert(data);
					button.removeAttr('disabled').removeClass('disabled');
				}
		});
	}
});





/******************************* SUPPLIER ADDRESS *****************************************************/


$(document).off('dblclick',contentSPPLR+' .supplieraddressrow').on('dblclick',contentSPPLR+' .supplieraddressrow',function(){


		var modal = '#'+$(this).closest('.modal').attr('id'),
		    street = $(this).attr('street'),
		    district = $(this).attr('district'),
		    city = $(this).attr('city'),
		    region = $(this).attr('region'),
		    zipcode = $(this).attr('zipcode'),
		    country = $(this).attr('country');

		$(modal+' .street').val(street);
	    $(modal+' .district').val(district);
	    $(modal+' .city').val(city);
	    $(modal+' .region').val(region);
	    $(modal+' .zipcode').val(zipcode);


	    $(this).closest('table').find('.supplieraddressrowcheckbox').prop('checked',false);
	    $(this).closest('tr').find('.supplieraddressrowcheckbox').prop('checked',true);

	    if(country!=null&&country!=''&&country!='null'&&country!='NULL'){
	    	$(modal+" .country").empty().append('<option selected value="'+country+'">'+country+'</option>').trigger('change');
	    }
	    else{
	    	$(modal+" .country").empty().trigger('change');
	    }


});



$(document).off('click',contentSPPLR+' .viewsupplieraddressbtn').on('click',contentSPPLR+' .viewsupplieraddressbtn',function(){
		var id = $(this).attr('rowid');
		var supplier = $(this).attr('supplier');

		$(contentSPPLR+' #viewsupplieraddressmodal .viewsupplieraddressmodal-shipperid').val(id);
		$(contentSPPLR+' #viewsupplieraddressmodal').modal('show');
		$(contentSPPLR+' #viewsupplieraddressmodal .viewsupplieraddressmodal-suppliername').html(supplier);

		$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
				url:'loadables/ajax/maintenance.supplier-address.php?id='+id,
				sortname: "default_flag",
				sortorder: "desc"
		}).flexReload(); 


});


function clearSupplierAddressFields(modal){
	var street = $(modal+' .street').val(''),
        district = $(modal+' .district').val(''),
        city = $(modal+' .city').val(''),
        region = $(modal+' .region').val(''),
        zipcode = $(modal+' .zipcode').val('');
        //country = $(modal+' .country').empty().trigger('change');		


}

$(document).off('click',contentSPPLR+' .viewsupplieraddressmodal-clearbtn').on('click',contentSPPLR+' .viewsupplieraddressmodal-clearbtn',function(){
	
	var modal = '#'+$(this).closest('.modal').attr('id');
	clearSupplierAddressFields(modal);
	$(modal+' .street').focus();

});



$(document).off('click',contentSPPLR+' .viewsupplieraddressmodal-addbtn:not(".disabled")').on('click',contentSPPLR+' .viewsupplieraddressmodal-addbtn:not(".disabled")',function(){


	var btn = $(this);
	    btn.addClass('disabled');


    var modal = '#'+$(this).closest('.modal').attr('id'),
        supplierid = $(modal+' .viewsupplieraddressmodal-shipperid').val(),
        street = $(modal+' .street').val(),
        district = $(modal+' .district').val(),
        city = $(modal+' .city').val(),
        region = $(modal+' .region').val(),
        zipcode = $(modal+' .zipcode').val(),
        country = $(modal+' .country').val();

    if(street==''){
    	btn.removeClass('disabled');
    	say("Please provide street address");
    }
    else{
    	$('#loading-img').removeClass('hidden');
    	$.post(server+'supplier.php',{addAddress:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',supplierid:supplierid,street:street,district:district,city:city,region:region,zipcode:zipcode,country:country},function(data){
    			

    			if(data.trim()=='success'){
					
						
						$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "created_date",
											sortorder: "desc"
						}).flexReload(); 
						
						clearSupplierAddressFields(modal);
						$(modal+' .street').focus();
						btn.removeClass('disabled');
						$('#loading-img').addClass('hidden');


				}
				else if(data.trim()=='noaddpermission'){		
					    $('#loading-img').addClass('hidden');
						btn.removeClass('disabled');
    					say("Unable to add address. No permission to add supplier address.");
				}
				else if(data.trim()=='invalidsupplier'){
					    $(modal).modal('hide');
					    $(modal).on('hidden.bs.modal',function(){
					    	$('#loading-img').addClass('hidden');
						    btn.removeClass('disabled');
    					    say("Unable to add address. Invalid Supplier ID.");
					        $(modal).off('hidden.bs.modal');

					    });
					    
				}
				else{
					   $('#loading-img').addClass('hidden');
					   alert(data);
					   btn.removeClass('disabled');
				}


    	});

    }



});



$(document).off('click',contentSPPLR+' .tagasdefaultsupplieraddressbtn:not(".disabled")').on('click',contentSPPLR+' .tagasdefaultsupplieraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsupplieraddressmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Default Address',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsDefaultAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "street",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});

$(document).off('click',contentSPPLR+' .tagasinactivesupplieraddressbtn:not(".disabled")').on('click',contentSPPLR+' .tagasinactivesupplieraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsupplieraddressmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Inactive',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsInactiveAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "street",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});

$(document).off('click',contentSPPLR+' .tagasactivesupplieraddressbtn:not(".disabled")').on('click',contentSPPLR+' .tagasactivesupplieraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsupplieraddressmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Active',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsActiveAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsupplieraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-address.php?id='+supplierid,
											sortname: "street",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});







/******************************* SUPPLIER ADDRESS - END *****************************************************/











/******************************* SUPPLIER CONTACT *****************************************************/


$(document).off('dblclick',contentSPPLR+' .suppliercontactrow').on('dblclick',contentSPPLR+' .suppliercontactrow',function(){


		var modal = '#'+$(this).closest('.modal').attr('id'),
		    name = $(this).attr('name'),
		    position = $(this).attr('position'),
		    mobile = $(this).attr('mobile'),
		    telephone = $(this).attr('telephone'),
		    email = $(this).attr('email');

		$(modal+' .name').val(name);
	    $(modal+' .position').val(position);
	    $(modal+' .mobile').val(mobile);
	    $(modal+' .telephone').val(telephone);
	    $(modal+' .email').val(email);


	    $(this).closest('table').find('.suppliercontactrowcheckbox').prop('checked',false);
	    $(this).closest('tr').find('.suppliercontactrowcheckbox').prop('checked',true);

	    


});



$(document).off('click',contentSPPLR+' .viewsuppliercontactbtn').on('click',contentSPPLR+' .viewsuppliercontactbtn',function(){
		var id = $(this).attr('rowid');
		var supplier = $(this).attr('supplier');

		$(contentSPPLR+' #viewsuppliercontactmodal .viewsuppliercontactmodal-shipperid').val(id);
		$(contentSPPLR+' #viewsuppliercontactmodal').modal('show');
		$(contentSPPLR+' #viewsuppliercontactmodal .viewsuppliercontactmodal-suppliername').html(supplier);

		$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
				url:'loadables/ajax/maintenance.supplier-contact.php?id='+id,
				sortname: "default_flag",
				sortorder: "desc"
		}).flexReload(); 


});


function clearSupplierContactFields(modal){
	var street = $(modal+' .name').val(''),
        district = $(modal+' .position').val(''),
        city = $(modal+' .mobile').val(''),
        region = $(modal+' .telephone').val(''),
        zipcode = $(modal+' .email').val('');
        //country = $(modal+' .country').empty().trigger('change');		


}

$(document).off('click',contentSPPLR+' .viewsuppliercontactmodal-clearbtn').on('click',contentSPPLR+' .viewsuppliercontactmodal-clearbtn',function(){
	
	var modal = '#'+$(this).closest('.modal').attr('id');
	clearSupplierContactFields(modal);
	$(modal+' .name').focus();

});



$(document).off('click',contentSPPLR+' .viewsuppliercontactmodal-addbtn:not(".disabled")').on('click',contentSPPLR+' .viewsuppliercontactmodal-addbtn:not(".disabled")',function(){


	var btn = $(this);
	    btn.addClass('disabled');


    var modal = '#'+$(this).closest('.modal').attr('id'),
        supplierid = $(modal+' .viewsuppliercontactmodal-shipperid').val(),
        name = $(modal+' .name').val(),
        position = $(modal+' .position').val(),
        mobile = $(modal+' .mobile').val(),
        telephone = $(modal+' .telephone').val(),
        email = $(modal+' .email').val();

    if(name==''){
    	btn.removeClass('disabled');
    	say("Please provide contact name");
    }
    else{
    	$('#loading-img').removeClass('hidden');
    	$.post(server+'supplier.php',{addContact:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',supplierid:supplierid,name:name,position:position,mobile:mobile,telephone:telephone,email:email},function(data){
    			

    			if(data.trim()=='success'){
					
						
						$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "created_date",
											sortorder: "desc"
						}).flexReload(); 
						
						clearSupplierContactFields(modal);
						$(modal+' .name').focus();
						btn.removeClass('disabled');
						$('#loading-img').addClass('hidden');


				}
				else if(data.trim()=='noaddpermission'){		
					    $('#loading-img').addClass('hidden');
						btn.removeClass('disabled');
    					say("Unable to add contact. No permission to add supplier contact.");
				}
				else if(data.trim()=='invalidsupplier'){
					    $(modal).modal('hide');
					    $(modal).on('hidden.bs.modal',function(){
					    	$('#loading-img').addClass('hidden');
						    btn.removeClass('disabled');
    					    say("Unable to add contact. Invalid Supplier ID.");
					        $(modal).off('hidden.bs.modal');

					    });
					    
				}
				else{
					   $('#loading-img').addClass('hidden');
					   alert(data);
					   btn.removeClass('disabled');
				}


    	});

    }



});



$(document).off('click',contentSPPLR+' .tagasdefaultsuppliercontactbtn:not(".disabled")').on('click',contentSPPLR+' .tagasdefaultsuppliercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsuppliercontactmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Default Contact',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsDefaultContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "name",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});

$(document).off('click',contentSPPLR+' .tagasinactivesuppliercontactbtn:not(".disabled")').on('click',contentSPPLR+' .tagasinactivesuppliercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsuppliercontactmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Inactive',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsInactiveContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "name",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});

$(document).off('click',contentSPPLR+' .tagasactivesuppliercontactbtn:not(".disabled")').on('click',contentSPPLR+' .tagasactivesuppliercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var supplierid = $(modal+' .viewsuppliercontactmodal-shipperid').val();
	

	$.confirm({
					animation: 'bottom', 
					closeAnimation: 'top',
					animationSpeed: 1000,
					animationBounce:1,
					title: 'Tag as Active',
					content: 'Do you want to continue?',
					confirmButton: 'Confirm',
					cancelButton: 'Cancel',	
					confirmButtonClass: 'btn-maroon', 
					cancelButtonClass: 'btn-maroon', 
					theme: 'white', 

					confirm: function(){
							
							$.post('../scripts/supplier.php',{tagAsActiveContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,supplierid:supplierid},function(response){

								if(response.trim()=='success'){
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentSPPLR+' #viewsuppliercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.supplier-contact.php?id='+supplierid,
											sortname: "street",
											sortorder: "asc"
									}).flexReload(); 
									userAccess();
								}
								else{
									alert(response);
									btn.removeClass('disabled');
								}

							});
					},
					cancel:function(){

					}
    });

});







/******************************* SUPPLIER CONTACT - END *****************************************************/