_ = require 'underscore'
get-useful-info = (weather-info)->
  _.pick weather-info, ['city', 'temp1', 'temp2', 'weather']

module.exports =
  get-useful-info: get-useful-info


