require! ['http']
db = require '../utils/database'

get-weather-info = !(cid, callback)->
  options =
    hostname: 'www.weather.com.cn'
    port: 80
    path: "/data/cityinfo/#{cid}.html"
    method: 'GET'

  req = http.request options, !(res)->
    weather-info = ''
    res.set-encoding 'utf-8'
    res.on 'data', !(chunk)->
       weather-info += chunk

    res.on 'end', !->
      callback JSON.parse weather-info
      #send-mail JSON.parse result

    res.on 'error', !(err)->
      console.log err

  req.on 'error', !(err)->
    console.log err

  req.end!

get-city-id = !(location, callback)->
  (results) <-! db.query-collection 'cities', {name: location}
  callback results[0].cid

get-new-weather-info = !(city-id, callback)->
  (weather-info) <-! get-weather-info city-id
  callback  weather-info

module.exports =
  get-weather: !(location, callback)->
    (city-id) <-! get-city-id location
    unless typeof (city-err = city-id) is Error
      (new-weather-info) <-! get-new-weather-info city-id
      callback new-weather-info
    else callback city-err
