config = {api: {}}

production = false

config.api.root = if production
  'http://api-100km.herokuapp.com/'
else
  'http://api-100km-42466.euw1.actionbox.io:9292/'


module.exports = config