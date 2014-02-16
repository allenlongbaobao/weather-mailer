require! 'http'

send-mail = (weather-info)->
  console.log weather-info
  useful-info = weather-parse-module.get-useful-info weather-info.weatherinfo
  message = create-message useful-info
  mail-sender = new mail-module.mail-sender message
  mail-sender.send!

create-message = (useful-info)->
  message = useful-info.city + "今天的天气为："+  useful-info.weather + " 最低温度：" + useful-info.temp2 + ", 最高温度： " + useful-info.temp1

getweather = !->
  options =
    hostname: 'www.weather.com.cn'
    port: 80
    path: '/data/cityinfo/101210502.html'
    method: 'GET'

  req = http.request options, !(res)->
    result = ''
    res.set-encoding 'utf-8'
    res.on 'data', !(chunk)->
      result += chunk

    res.on 'end', !->
      send-mail JSON.parse result

    res.on 'error', !(err)->
      console.log err

  req.on 'error', !(err)->
    console.log err

  req.end!

module.exports =
  get-weather: !(req, res)->
    res.end 'hh'

  subscribe-weather: !(req, res, next)->
    res.end 'subscribe weather success!'
    next!

  cancel-subscribe: !(req, res, next)->
    res.en 'cancel subscribe success!'
    next!
