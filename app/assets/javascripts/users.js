/*when green button is clicked, send ajax put request to change the lesson status
if it was successful, change the color of the button to
*/

$('.small.button.success').click(function() {
	console.log($(this).data('id'));
});