View = require 'views/base/view'

module.exports = class HomePageView extends View
  autoRender: true
  className: 'home-page'
  regions:
    info:'#info'
  template: require './templates/home'
