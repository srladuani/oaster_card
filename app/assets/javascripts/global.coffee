#### signin form validations ####
App.signinFormValidator = ->
  $("#signin_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[email]":
        required: true
        email: true
      "user[password]":
        required: true
    messages:
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."

      "user[password]":
        required: "Password is required."

#### signup form validations ####
App.signUpFormValidator = ->
  $("#new_user").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[name]":
        required: true
      "user[email]":
        required: true
        email: true
      "user[password]":
        minlength: 8
        required: true

      "user[password_confirmation]":
        required: true
        minlength: 8
        equalTo: "#user_password"
    messages:
      "user[name]":
        required: "Name is required."
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."

      "user[password]":
        required: "Password is required."

      "user[password_confirmation]":
        required: "Confirm password is required."
        equalTo: "Password and Confirm Password does not match."


#### new password form validations ####
App.newPasswordFormValidator = ->
  $("#new_password_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[email]":
        required: true
        email: true
    messages:
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."

#### edit password form validations ####
App.editPasswordFormValidator = ->
  $("#edit_password_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[password]":
        minlength: 8
        required: true

      "user[password_confirmation]":
        required: true
        minlength: 8
        equalTo: "#user_password"
    messages:
      "user[password]":
        required: "Password is required."
      "user[password_confirmation]":
        required: "Confirm password is required."
        equalTo: "Password and Confirm Password does not match."