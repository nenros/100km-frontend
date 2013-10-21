config = require 'config'
# Base model.
module.exports = class Model extends Chaplin.Model
   apiRoot: config.api.root
