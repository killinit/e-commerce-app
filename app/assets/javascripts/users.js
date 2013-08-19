/*when green button is clicked, send ajax put request to change the lesson status
if it was successful, change the color of the button to
*/

$('.small.button.success').click(function() {
	var button_clicked = $(this);
	var lesson_to_update_id = $(this).data('id');
	var updated_status = '';
	if ($(this).data('status') == 'Available') {
		updated_status = 'Used';
	}
	else {
		updated_status = 'Available';
	}

	$.ajax({
		url : '/users/'+lesson_to_update_id, 
		type: 'PUT',
		data: { 'status' : updated_status}, 
		success : function(res) {
			if (button_clicked.data('status') == 'Available') {
				console.log('make it red');
				button_clicked.removeClass('success');
				button_clicked.addClass('alert');
				console.log(button_clicked.attr('class'));
				button_clicked.data('status') == 'Used';
			}
			else {
				console.log('make it green');
				button_clicked.removeClass('alert');
				button_clicked.addClass('success');
				console.log(button_clicked.attr('class'));
				button_clicked.data('status') == 'Available';
			}
		}//end success callback
	});//end ajax function
});