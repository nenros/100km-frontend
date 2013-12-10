module.exports = (match) ->
  match 'rejestracja', 'home#register'
  match 'login', 'home#login'
  match '', 'home#index'

