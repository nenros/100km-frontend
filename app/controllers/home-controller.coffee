Controller = require 'controllers/base/controller'
HomePageView = require 'views/home/home-page-view'
RegisterView = require 'views/home/register-view'


module.exports = class HomeController extends Controller
  beforeAction: ->
    super

  index: ->
    @view = new HomePageView region: 'main'

  register: ->
    @adjustTitle('Rejestracja')
    @view = new RegisterView region: 'main'  
  

