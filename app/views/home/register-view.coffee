View = require 'views/base/view'

module.exports = class RegisterView extends View
  autoRender: true
  className: 'register'
  regions:
    districts:'#districts'
  template: require './templates/register'
