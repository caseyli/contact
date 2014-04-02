$(function(){
  $(".contact-submit").click(submitContactSubmit);
});

function submitContactSubmit() {

  /* Gather Contact Form Values - YOUR FIELDS HERE */
  var full_name = $("#full_name").val();
  var email = $("#email").val();
  var cell_phone = $("#cell_phone").val();
  var message = $("#message").val();
  var allow_sms_response = $("#allow_sms_response:checked").length > 0;

  /* Contact Form Elements */
  var submitElement = $(this);
  var resultsElement = $($(this).closest(".contact-form").siblings(".contact-submit-results")[0]);

  

  /* Put into waiting state */
  putElementIntoWaitState(submitElement, true);

  /* Submit Form */
  $.ajax({
    url:"/contact",
    type: "POST",
    data: { 
        full_name : full_name, 
        email : email, 
        cell_phone : cell_phone, 
        message : message, 
        allow_sms_response : allow_sms_response },
    dataType: "json",
    success:function(data, textStatus, jqXHR){
      if(data.success) {
        reportSuccess(resultsElement);
        clearContactForm();
      }
      else {
        reportError(resultsElement, data.message);
      }
      putElementIntoWaitState(submitElement, false);
    },
    error:function(jqXHR, textStatus, errorThrown){
      reportError(resultsElement, "There was a general error.");
      putElementIntoWaitState(submitElement, false);
    }
  });
  
  return false;
}

function putElementIntoWaitState(element, waitState) {
  if(waitState) {
    element.html("<img src='/assets/ajax-loader.gif' class='ajax-loader'/> Submitting...");
    element.attr('disabled', 'disabled');
  }
  else {
    element.removeAttr('disabled');
    element.html("Submit");
  }
}

function clearContactForm() {
  $(".contact-form input").val();
  $(".contact-form textarea").val();
  $(".contact-form checkbox").val();
}

function reportSuccess(element) {
  element.removeClass("contact-submit-error");
  element.addClass("contact-submit-success");
  element.html("Success! Thanks for contacting us!");
}

function reportError(element, message) {
  element.removeClass("contact-submit-success");
  element.addClass("contact-submit-error");
  element.html("Sorry, we could not submit your information: " + message);
}