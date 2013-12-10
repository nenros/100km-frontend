Controller = require 'controllers/base/controller'
HomePageView = require 'views/home/home-page-view'
RegisterView = require 'views/home/register-view'
LoginView = require 'views/home/login-view'
Collection = require 'models/base/collection'
District = require 'models/District'
MainPageInfo = require 'models/MainPageInfo'
mainPageInfoView = require 'views/home/mainPageInfo-view'
districtSelectListView = require 'views/home/districtsSelectList-view'
config = require 'config'


module.exports = class HomeController extends Controller
  beforeAction: ->
    super

  index: ->
    @view = new HomePageView region: 'main'
    @info = new MainPageInfo
    @infoView = new mainPageInfoView model: @info, region: 'info'
    @info.fetch().then =>
      @infoView.render()

  register: ->
    @view = new RegisterView region: 'main'
    @districts = new Collection null, model: District
    @districts.url = "#{config.api.root}districts"
    @districtsList = new districtSelectListView collection: @districts, region: 'districts'
    @districts.fetch().then =>
      @districtsList.render()
    @adjustTitle('Rejestracja')

  login: ->
    @view = new LoginView region: 'main'
    @adjustTitle('Logowanie')


  

