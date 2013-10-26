config = {api: {}}

production = false
config.rodloDate = moment('2014-05-01')
config.api.root = if production
  'http://api-100km.herokuapp.com/'
else
  'http://api-100km-42466.euw1.actionbox.io:9393/'


module.exports = config