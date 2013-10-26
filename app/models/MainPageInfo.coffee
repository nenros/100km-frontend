Model = require '/models/base/model'
config = require 'config'

module.exports = class MainPageInfo extends Model
  url: config.api.root
  defaults:
    daysToRodlo: ()->
      today = moment()
      return config.rodloDate.diff today, 'days'
      
