View = require 'views/base/view'

module.exports = class DistrictView extends View
  template: require './templates/district'
  noWrap: true
  render: () ->
    @.setElement(@.template(@.model.attributes))

