// $('#section-summary').click(function() {
//   var package_selected = getSelectedPackage();
//   var name_first = $('#purchase_name_first').val();
//   var name_last = $('#purchase_name_last').val();
//   var phone_number = $('#purchase_phone').val();
//   var email = $('#purchase_email').val();
//   $('#summary_name_first').html("First Name: " + name_first);
//   $('#summary_name_last').html("Last Name: " + name_last);
//   $('#summary_phone').html("Phone: " + phone_number);
//   $('#summary_email').html("Email: " + email);
//   $('#' + package_selected).removeClass('hidden-package');
// });

// $('#section-package').click(function() {
//     //clear the selected package from the order summary section
//   $('#' + getSelectedPackage()).addClass('hidden-package');
// });

function getSelectedPackage() {
  return $('input[type="radio"][name="purchase[package]"]:checked').val() + "selected";
}

jQuery(function($) {
  $('#new_purchase').submit(function(event) {
    var $form = $(this);
    $form.find('commit').prop('disabled', true);
    Stripe.createToken($form, stripeResponseHandler);
    return false;
  });
});

var stripeResponseHandler = function(status, response) {
  var $form = $('#new_purchase');

  if (response.error) {
    $form.find('.payment-errors').text(response.error.message);
    $("#section-payment").click();
    $form.find('commit').prop('disabled', false);
  } else {
    // token contains id, last4, and card type
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    $form.get(0).submit();
  }
};
