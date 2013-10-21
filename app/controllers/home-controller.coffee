Controller = require 'controllers/base/controller'
HomePageView = require 'views/home/home-page-view'
RegisterView = require 'views/home/register-view'
Collection = require 'models/base/collection'
District = require 'models/District'
districtSelectListView = require 'views/home/districtsSelectList-view'
config = require 'config'


module.exports = class HomeController extends Controller
  beforeAction: ->
    super

  index: ->
    @view = new HomePageView region: 'main'

  register: ->
    @view = new RegisterView region: 'main'
    @districts = new Collection null, model: District
    @districts.url = "#{config.api.root}/districts"
    @districtsList = new districtSelectListView collection: @districts, region: 'districts'
    @districts.fetch().then =>
      @districtsList.render()
    @adjustTitle('Rejestracja')

  

