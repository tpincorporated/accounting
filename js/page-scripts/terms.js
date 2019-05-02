$(document).off('click','.edittermsbtn').on('click','.edittermsbtn',function(){
	var modal = "#edittermsmodal";
	$(modal+' .statusflag').val($(this).attr('activeflag')).trigger('change');
	$(modal+' .code').val($(this).attr('code'));
	$(modal+' .description').val($(this).attr('desc'));
	$(modal+' .termsmodalid').val($(this).attr('rowid'));
	$(modal+' .days').val($(this).attr('days'));
});

/***************************** SAVE | EDIT **************************************************/
$(document).off('click','.termsmodal-savebtn:not(".disabled")').on('click','.termsmodal-savebtn:not(".disabled")',function(){
	var modal = '#'+$(this).closest('.modal').attr('id'),
		code = $(modal+' .code').val(),
		desc = $(modal+' .description').val(),
		days = $(modal+' .days').val(),
		statusflag = 1,
		id='',
		newsort = 'created_date',
		source='add',
		button=$(this);
		button.addClass('disabled').attr('disabled','disabled');

	if(modal=='#edittermsmodal'){
		id = $(modal+' .termsmodalid').val();
		statusflag = $(modal+' .statusflag').val();
		source = 'edit';
		newsort = 'updated_date';
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
	else if(statusflag!=1&&statusflag!=0){
		$(modal+' .errordiv').html("<div class='message'><div class='message-content'><span class='closemessage'>&times;</span>Please select status flag.</div></div>");
		button.removeAttr('disabled').removeClass('disabled');
	}
	else{
		$('#loading-img').removeClass('hidden');
		$.post(server+'terms.php',{termsSaveEdit:'j$isnDPo#P3sll3p23a3!@3kzlsO!mslo#k@',source:source,id:id,code:code,desc:desc,statusflag:statusflag,days:days},function(data){
				if(data.trim()=='success'){
					$(modal).modal('hide');
					$(modal).on('hidden.bs.modal',function(){
						
						$('#termstable').flexOptions({
											url:'loadables/ajax/maintenance.terms.php',
											sortname: newsort,
											sortorder: "desc"
						}).flexReload(); 
						$('#loading-img').addClass('hidden');
						$(modal).off('hidden.bs.modal');
						button.removeAttr('disabled').removeClass('disabled');
						$(modal+' .code').val('');
						$(modal+' .description').val('');
						$(modal+' .days').val('');


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

/******************************* DELETE *****************************************************/
