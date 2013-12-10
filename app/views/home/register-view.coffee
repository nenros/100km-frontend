View = require 'views/base/view'
successRegisterView = require './subviews/successRegister'
config = require 'config'

module.exports = class RegisterView extends View
  autoRender: true
  className: 'register'
  regions:
    districts:'#units_districts'
  template: require './templates/register'
  initialize: ()->
    super
    @delegate 'click', 'button#register', @formValidate

              
  
  formValidate: (e)->
    $('form#form').find('input').removeClass('alert-danger')
    #return @empty_input(input) for input in inputs when input.value is ""
    form = $('form#form').serializeObject()
    if form.user.password != form.user.password_confirmation
      $('#error').append('<div class="alert alert-danger">\n
                         <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n
                         Hasła się nie zgadzają!\n 
                         </div>')
      $('input#password').addClass('alert-danger')
      $('input#password_confirmation').addClass('alert-danger')
      return

    $.ajax(
      type: "POST",
      url: config.api.root+'user',
      data: form,
      error: (data)->
        console.log(data)
        error_add = (error_code, input_name)->
          switch input_name
            when "password" then name = "Hasło"
            when "first_name" then name = "Imię"
            when "last_name" then name = "Nazwisko"
            when "phone_number" then name = "Numer telefonu"
            when "email" then name = "Email"
            when "name" then name = "Nazwa"
            when "shortname" then name = "Skrót"
            when "scouts_number" then name = "Ilość harcerzy"
            when "city" then name = "Miasto"

          if error_code is "can't be blank"
            error_text = "Pole <em>#{name}</em> nie może być puste."
          else if error_code is "is too short (minimum is 3 characters)"
            error_text = "Pole <em>#{name}</em> musi mieć przynajmniej 3 znaki długości."
          else if error_code is "is too short (minimum is 6 characters)"
            error_text = "Pole <em>#{name}</em> musi mieć przynajmniej 6 znaków długości."
          else if error_code is "is not a number"
            error_text = "Pole <em>#{name}</em> musi być ciągiem cyfr."
          else if error_code is "has already been taken"
            error_text = "<em>#{name}</em> już istnieje w bazie."
          else
            error_text = "Niesprecyzowany błąd w polu <em>#{name}</em>"

          $("input##{input_name}").addClass('alert-danger')
          $('#error').append("<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>#{error_text}</div>")
          
        errors = JSON.parse(data.responseText).errors
        if errors.user?
          for attr, errors of errors.user
            input_name = String(attr)
            for error in errors
              error_add(error, input_name)
          if errors.unit?
            for attr, errors of errors.unit
              input_name = String(attr)
              for error in errors
                error_add(error, input_name)
    ).success ()=>
      $(@el).empty()
      successView = new successRegisterView container: @el
      @subview 'success', successView
    
  empty_input: (input)->
    $(input).addClass('alert-danger')  

