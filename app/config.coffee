config = {api: {}}

production = false

config.api.root = if production
  'http://api-100km.herokuapp.com/'
else
  'http://localhost:9393/'


module.exports = config