require! ['http', '../business/weather']

send-mail = (weather-info)->
  console.log weather-info
  useful-info = weather-parse-module.get-useful-info weather-info.weatherinfo
  message = create-message useful-info
  mail-sender = new mail-module.mail-sender message
  mail-sender.send!

create-message = (useful-info)->
  message = useful-info.city + "今天的天气为："+  useful-info.weather + " 最低温度：" + useful-info.temp2 + ", 最高温度： " + useful-info.temp1



module.exports =
  get-weather: !(req, res)->
    location = req.query.location
    (new-weather) <-! weather.get-weather location
    response = {result: 'success'} <<< new-weather
    res.end JSON.stringify response

  subscribe-weather: !(req, res, next)->
    res.end 'subscribe weather success!'
    next!

  cancel-subscribe: !(req, res, next)->
    res.en 'cancel subscribe success!'
    next!
