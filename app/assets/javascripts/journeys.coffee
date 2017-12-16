class App.Journeys extends App.Base

  beforeAction: (action) =>
    return


  afterAction: (action) =>
    return


  index: =>
    return


  show: =>
    return


  new: =>
    return


  edit: =>
    # journey form selector
    $journeyForm = $("#journey_form")
    
    # client side validations on task form.
    $($journeyForm).submit (event) ->
      console.log "in submit!"
      $($journeyForm).validate
        focusInvalid: true
        errorClass: 'invalid'
        validClass: 'valid'
        errorPlacement: (error, element) ->
          error.insertAfter $(element)

        rules:
          "journey[origin]":
            required: true
          "journey[destination]":
            required: true
            notEqualTo: "#journey_origin"
          
      if $($journeyForm).valid()
        return true
      # Prevent the form from being submitted:
      return false
    return
