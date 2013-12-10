View = require 'views/base/view'

module.exports = class HomePageView extends View
  autoRender: true
  className: 'col-xs-12 col-md-10 col-md-offset-1'
  regions:
    info:'#info'
  template: require './templates/home'
