class App.Cards extends App.Base

  beforeAction: (action) =>
    return


  afterAction: (action) =>
    return


  index: =>
    return


  show: =>
    return


  new: =>
    new App.Cards().cardFormHandler()
    return


  edit: =>
    new App.Cards().cardFormHandler()
    return

  cardFormHandler: =>
    # card form selector
    $cardForm = $("#card_form")
    
    # client side validations on task form.
    $($cardForm).submit (event) ->
      $($cardForm).validate
        focusInvalid: true
        errorClass: 'invalid'
        validClass: 'valid'
        errorPlacement: (error, element) ->
          error.insertAfter $(element)

        rules:
          "card[balance]":
            required: true
          
      if $($cardForm).valid()
        return true
      # Prevent the form from being submitted:
      return false
