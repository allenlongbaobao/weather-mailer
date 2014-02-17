get-city-id = !(location, callback)->

get-new-weatherinfo = !(city-id, callback)->

module.exports =
  get-weather: !(location, callback)->
    (city-id) <-! get-city-id location
    unless typeof (city-err = city-id) is Error
      (new-weather-info) <-! get-new-weather-info city-id
      callback new-weatherinfo
    else callback city-err
