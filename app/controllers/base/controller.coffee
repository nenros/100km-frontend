SiteView = require 'views/site-view'
NavbarView = require 'views/navbar/navbar-view'


module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: ->
    #apiResponse = $.getJSON('http://api-100km-42466.euw1.actionbox.io:9292/status')
    #console.log(apiResponse.text)
    @compose 'site', SiteView
    @compose 'navbar', NavbarView, region: 'navbar'
    
    
