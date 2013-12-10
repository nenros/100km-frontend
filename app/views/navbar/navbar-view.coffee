View = require 'views/base/view'
config = require 'config'

module.exports = class NavbarView extends View
  tagName: 'nav'
  className: 'navbar navbar-inverse navbar-static-top'
  template: require './templates/navbar'
  initialize: ()->
    super
    @delegate 'click', '.dropdown form', @stopDropdown
    @delegate 'click', '#login', @login
    
  stopDropdown: (e)->
     e.stopPropagation()
    
  login: (e)->
    e.preventDefault()
    data = $('#login-form').serialize()
    $.ajax(
            type: 'POST'
            url: config.api.root+'login',
            data: data, 
            success: (data)->
             console.log(data)
            error: (data)->
              console.log(data)
    )
