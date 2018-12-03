ready = ->
  if $("#landing-page").length > 0
    console.log("Landing page is loaded")
    $(".promotion-enquiry-form .submit-btn").click (event) ->
      console.log("Promotion Enquiry is submitted")
      event.preventDefault()
      form = $(this).closest(".promotion-enquiry-form")
      $.post form.attr("action"), form.serialize(), (response) ->
        console.log("Response type: " + response.type)
        if response.type is 'success'
          console.log("Response type is success")
          form.hide()
          msg = "Your enquiry has been submitted. Your reference number is "
          msg += response.data.uid
          msg += ". One of our team members will get back to you shortly."
          form.prev(".promotion-form-response").removeClass('error').addClass('success').html msg
        else if response.type is 'error'
          msg = "<h4>Please correct these errors:</h4>"
          msg += "<ul>"
          $.each response.data, (key, value) ->
            console.log("Response type = 'error'")
            console.log(response.data)
            $.each value, (i, val) ->
              msg += "<li>" + val + "</li>"
              return
          msg += "</ul>"
          form.prev(".promotion-form-response").removeClass('success').addClass('error').html msg
        else
          form.prev(".promotion-form-response").removeClass('success').addClass('error').html "There was a connection error while submitting your enquiry. Please try again soon."
      , "json"

$(document).ready ready
$(document).on "page:load", ready
