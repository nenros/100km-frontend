View = require 'views/base/view'

module.exports = class RegisterView extends View
  autoRender: true
  className: 'register'
  regions:
    districts:'#units_districts'
  template: require './templates/register'
