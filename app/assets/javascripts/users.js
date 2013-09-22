$(function() {
  $( "#datepicker" ).datepicker();
 	$('.datepicker').each(function(index, item) {
 		$(item).datepicker({ dateFormat: 'dd-mm-yy' });
 	}); 
});

$('.small.button').click(function() {
	var buttonClicked = $(this);
	var lesson_to_update_id = $(this).data('id');
	var updated_status = '';
	var dateOfLesson = '';
	var statusLabel = $('#label-' + lesson_to_update_id);
	var dateField = $('#date-' + lesson_to_update_id);
	var dateCell = $('#tablecell-' + lesson_to_update_id);
	if (statusLabel.data('status') == 'Available') {
		updated_status = 'Used';
		dateOfLesson = dateField.val();
	}
	else {
		updated_status = 'Available';
		dateOfLesson = null;
	}

	
	$.ajax({
		url : '/users/'+lesson_to_update_id, 
		type: 'PUT',
		data: {'status' : updated_status, 'dateused' : dateOfLesson}, 
		success : function(res) {
			if (statusLabel.data('status') == 'Available') {
				statusLabel.removeClass('success');
				statusLabel.addClass('alert');
				statusLabel.data('status','Used');
				statusLabel.text('Used');
				dateCell.html('<span>' + dateOfLesson + '</span>');
				buttonClicked.text('Edit');
			}
			else {
				statusLabel.removeClass('alert');
				statusLabel.addClass('success');
				statusLabel.data('status','Available');
				statusLabel.text('Available');
				dateCell.html('<input type="text" id="date-'+lesson_to_update_id+'" data-id="'+lesson_to_update_id+'">');
				$("#date-" + lesson_to_update_id).datepicker({ dateFormat: 'dd-mm-yy' });
				// dateField.val('');
				buttonClicked.text('Submit');
			}
		}//end success callback
	});//end ajax function

	return false;
});


// when submit button is clicked:
// 	update the database with the status and date
// 	change the button text to "update"
// 	change the status label to Used (red)

// when update button is clicked:
// 	change the status back to Available (green)
// 	remove the date from the database
