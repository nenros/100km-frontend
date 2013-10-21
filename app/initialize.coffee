Application = require 'application'
routes = require 'routes'

# Initialize the application on DOM ready event.
$ ->
  new Application {
    title: '100km na 100lecie',
    controllerSuffix: '-controller',
    routes
  }
