View = require 'views/base/view'

module.exports = class RegisterView extends View
  autoRender: true
  className: 'register'
  template: require './templates/register'
