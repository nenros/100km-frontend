CollectionView = require 'views/base/collection-view'
District = require 'views/home/district-view'

module.exports = class DistrictsView extends CollectionView
  template: require './templates/districts'
  itemView: District





