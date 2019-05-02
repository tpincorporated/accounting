

var contentCLIENT = '#customer-menutabpane';


$(document).off('click',contentCLIENT+' .editcustomerbtn').on('click',contentCLIENT+' .editcustomerbtn',function(){
	var modal = "#editcustomermodal";
	var rowid = $(this).attr('rowid');
	$(modal+' .customermodalid').val(rowid);

	$.post(server+'customer.php',{customerGetInfo:'kjoI$H2oiaah3h0$09jDppo92po@k@',id:rowid},function(data){
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


			if(rsp["customergroup"]!=null&&rsp["customergroupid"]>0){
				$(modal+" .customergroup").empty().append('<option selected value="'+rsp["customergroupid"]+'">'+rsp["customergroup"]+'</option>').trigger('change');
			}
			else{
				$(modal+" .customergroup").empty().trigger('change');
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
$(document).off('click',contentCLIENT+' .customermodal-savebtn:not(".disabled")').on('click',contentCLIENT+' .customermodal-savebtn:not(".disabled")',function(){
	var modal = '#'+$(this).closest('.modal').attr('id'),
		code = $(modal+' .code').val(),
		desc = $(modal+' .description').val(),
		customergroup = $(modal+' .customergroup').val(),
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

	if(modal=='#editcustomermodal'){
		id = $(modal+' .customermodalid').val();
		statusflag = $(modal+' .statusflag').val();
		source = 'edit';
		newsort = 'updated_date';
	}


	if(customergroup==null||customergroup=='null'||customergroup=='NULL'||customergroup==''){
		customergroup = 'NULL';
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
		$.post(server+'customer.php',{customerSaveEdit:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',source:source,id:id,code:code,desc:desc,customergroup:customergroup,terms:terms,fax:fax,tel:tel,mobile:mobile,email:email,statusflag:statusflag},function(data){
				if(data.trim()=='success'){
					$(modal).modal('hide');
					$(modal).on('hidden.bs.modal',function(){
						
						$('#customertable').flexOptions({
											url:'loadables/ajax/maintenance.customer.php',
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
						$(modal+' .customergroup').empty().trigger('change');
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





/******************************* CUSTOMER ADDRESS *****************************************************/


$(document).off('dblclick',contentCLIENT+' .customeraddressrow').on('dblclick',contentCLIENT+' .customeraddressrow',function(){


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


	    $(this).closest('table').find('.customeraddressrowcheckbox').prop('checked',false);
	    $(this).closest('tr').find('.customeraddressrowcheckbox').prop('checked',true);

	    if(country!=null&&country!=''&&country!='null'&&country!='NULL'){
	    	$(modal+" .country").empty().append('<option selected value="'+country+'">'+country+'</option>').trigger('change');
	    }
	    else{
	    	$(modal+" .country").empty().trigger('change');
	    }


});



$(document).off('click',contentCLIENT+' .viewcustomeraddressbtn').on('click',contentCLIENT+' .viewcustomeraddressbtn',function(){
		var id = $(this).attr('rowid');
		var customer = $(this).attr('customer');

		$(contentCLIENT+' #viewcustomeraddressmodal .viewcustomeraddressmodal-customerid').val(id);
		$(contentCLIENT+' #viewcustomeraddressmodal').modal('show');
		$(contentCLIENT+' #viewcustomeraddressmodal .viewcustomeraddressmodal-customername').html(customer);

		$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
				url:'loadables/ajax/maintenance.customer-address.php?id='+id,
				sortname: "default_flag",
				sortorder: "desc"
		}).flexReload(); 


});


function clearCustomerAddressFields(modal){
	var street = $(modal+' .street').val(''),
        district = $(modal+' .district').val(''),
        city = $(modal+' .city').val(''),
        region = $(modal+' .region').val(''),
        zipcode = $(modal+' .zipcode').val('');
        //country = $(modal+' .country').empty().trigger('change');		


}

$(document).off('click',contentCLIENT+' .viewcustomeraddressmodal-clearbtn').on('click',contentCLIENT+' .viewcustomeraddressmodal-clearbtn',function(){
	
	var modal = '#'+$(this).closest('.modal').attr('id');
	clearCustomerAddressFields(modal);
	$(modal+' .street').focus();

});



$(document).off('click',contentCLIENT+' .viewcustomeraddressmodal-addbtn:not(".disabled")').on('click',contentCLIENT+' .viewcustomeraddressmodal-addbtn:not(".disabled")',function(){


	var btn = $(this);
	    btn.addClass('disabled');


    var modal = '#'+$(this).closest('.modal').attr('id'),
        customerid = $(modal+' .viewcustomeraddressmodal-customerid').val(),
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
    	$.post(server+'customer.php',{addAddress:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',customerid:customerid,street:street,district:district,city:city,region:region,zipcode:zipcode,country:country},function(data){
    			

    			if(data.trim()=='success'){
					
						
						$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
											sortname: "created_date",
											sortorder: "desc"
						}).flexReload(); 
						
						clearCustomerAddressFields(modal);
						$(modal+' .street').focus();
						btn.removeClass('disabled');
						$('#loading-img').addClass('hidden');


				}
				else if(data.trim()=='noaddpermission'){		
					    $('#loading-img').addClass('hidden');
						btn.removeClass('disabled');
    					say("Unable to add address. No permission to add customer address.");
				}
				else if(data.trim()=='invalidcustomer'){
					    $(modal).modal('hide');
					    $(modal).on('hidden.bs.modal',function(){
					    	$('#loading-img').addClass('hidden');
						    btn.removeClass('disabled');
    					    say("Unable to add address. Invalid customer ID.");
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



$(document).off('click',contentCLIENT+' .tagasdefaultcustomeraddressbtn:not(".disabled")').on('click',contentCLIENT+' .tagasdefaultcustomeraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomeraddressmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsDefaultAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
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

$(document).off('click',contentCLIENT+' .tagasinactivecustomeraddressbtn:not(".disabled")').on('click',contentCLIENT+' .tagasinactivecustomeraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomeraddressmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsInactiveAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
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

$(document).off('click',contentCLIENT+' .tagasactivecustomeraddressbtn:not(".disabled")').on('click',contentCLIENT+' .tagasactivecustomeraddressbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomeraddressmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsActiveAddress:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomeraddressmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-address.php?id='+customerid,
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







/******************************* CUSTOMER ADDRESS - END *****************************************************/



/******************************* CUSTOMER CONTACT *****************************************************/


$(document).off('dblclick',contentCLIENT+' .customercontactrow').on('dblclick',contentCLIENT+' .customercontactrow',function(){


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


	    $(this).closest('table').find('.customercontactrowcheckbox').prop('checked',false);
	    $(this).closest('tr').find('.customercontactrowcheckbox').prop('checked',true);

	    


});



$(document).off('click',contentCLIENT+' .viewcustomercontactbtn').on('click',contentCLIENT+' .viewcustomercontactbtn',function(){
		var id = $(this).attr('rowid');
		var customer = $(this).attr('customer');

		$(contentCLIENT+' #viewcustomercontactmodal .viewcustomercontactmodal-customerid').val(id);
		$(contentCLIENT+' #viewcustomercontactmodal').modal('show');
		$(contentCLIENT+' #viewcustomercontactmodal .viewcustomercontactmodal-customername').html(customer);

		$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
				url:'loadables/ajax/maintenance.customer-contact.php?id='+id,
				sortname: "default_flag",
				sortorder: "desc"
		}).flexReload(); 


});


function clearcustomerContactFields(modal){
	var street = $(modal+' .name').val(''),
        district = $(modal+' .position').val(''),
        city = $(modal+' .mobile').val(''),
        region = $(modal+' .telephone').val(''),
        zipcode = $(modal+' .email').val('');
        //country = $(modal+' .country').empty().trigger('change');		


}

$(document).off('click',contentCLIENT+' .viewcustomercontactmodal-clearbtn').on('click',contentCLIENT+' .viewcustomercontactmodal-clearbtn',function(){
	
	var modal = '#'+$(this).closest('.modal').attr('id');
	clearcustomerContactFields(modal);
	$(modal+' .name').focus();

});



$(document).off('click',contentCLIENT+' .viewcustomercontactmodal-addbtn:not(".disabled")').on('click',contentCLIENT+' .viewcustomercontactmodal-addbtn:not(".disabled")',function(){


	var btn = $(this);
	    btn.addClass('disabled');


    var modal = '#'+$(this).closest('.modal').attr('id'),
        customerid = $(modal+' .viewcustomercontactmodal-customerid').val(),
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
    	$.post(server+'customer.php',{addContact:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',customerid:customerid,name:name,position:position,mobile:mobile,telephone:telephone,email:email},function(data){
    			

    			if(data.trim()=='success'){
					
						
						$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
											sortname: "created_date",
											sortorder: "desc"
						}).flexReload(); 
						
						clearcustomerContactFields(modal);
						$(modal+' .name').focus();
						btn.removeClass('disabled');
						$('#loading-img').addClass('hidden');


				}
				else if(data.trim()=='noaddpermission'){		
					    $('#loading-img').addClass('hidden');
						btn.removeClass('disabled');
    					say("Unable to add contact. No permission to add customer contact.");
				}
				else if(data.trim()=='invalidcustomer'){
					    $(modal).modal('hide');
					    $(modal).on('hidden.bs.modal',function(){
					    	$('#loading-img').addClass('hidden');
						    btn.removeClass('disabled');
    					    say("Unable to add contact. Invalid customer ID.");
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



$(document).off('click',contentCLIENT+' .tagasdefaultcustomercontactbtn:not(".disabled")').on('click',contentCLIENT+' .tagasdefaultcustomercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomercontactmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsDefaultContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
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

$(document).off('click',contentCLIENT+' .tagasinactivecustomercontactbtn:not(".disabled")').on('click',contentCLIENT+' .tagasinactivecustomercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomercontactmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsInactiveContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
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

$(document).off('click',contentCLIENT+' .tagasactivecustomercontactbtn:not(".disabled")').on('click',contentCLIENT+' .tagasactivecustomercontactbtn:not(".disabled")',function(){
	var btn = $(this);
	    btn.addClass('disabled');

	var id = $(this).attr('rowid');
	var modal = '#'+$(this).closest('.modal').attr('id');
	var customerid = $(modal+' .viewcustomercontactmodal-customerid').val();
	

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
							
							$.post('../scripts/customer.php',{tagAsActiveContact:'skj$oihdtpoa$I#@4noi4AIFNlskoRboIh4!j3sio$*yhs',id:id,customerid:customerid},function(response){

								if(response.trim()=='success'){
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
											sortname: "updated_date",
											sortorder: "desc"
									}).flexReload(); 
								}
								else if(response.trim()=='nopermission'){
									say("Access denied. No permission to edit.");
									$(contentCLIENT+' #viewcustomercontactmodal-tbl').flexOptions({
											url:'loadables/ajax/maintenance.customer-contact.php?id='+customerid,
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







/******************************* CUSTOMER CONTACT - END *****************************************************/
