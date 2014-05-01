require! ['http', '../business/weather', '../business/module/mail-module']

send-mail = (weather-info)->
  useful-info = weather-parse-module.get-useful-info weather-info.weatherinfo
  message = create-message useful-info
  mail-sender = new mail-module.mail-sender message
  mail-sender.send!

create-message = (useful-info)->
  message = useful-info.city + "今天的天气为："+  useful-info.weather + " 最低温度：" + useful-info.temp2 + ", 最高温度： " + useful-info.temp1

subscribe-weather-by-email = !(request)->
  <-! set-interval _, 3600*24 
  location = request.city
  (new-weather) <-! weather.get-weather location
  <-! send-mail new-weather

subscribe-weather = !(request, callback)->
  for type in request.push-type then
    if type is 'email' then subscribe-weather-by-email request
    if type is 'message' then subscribe-weather-by-message request
    if type is 'wechat' then subscribe-weather-by-wechat request
  callback!

module.exports =
  get-weather: !(req, res, next)->
    location = req.query.location
    (new-weather) <-! weather.get-weather location
    if (err = new-weather) instanceof Error then response = {result: 'failed', errors: err.message}
    else response = {result: 'success'} <<< new-weather
    res.send JSON.stringify response

  subscribe-weather: !(req, res, next)->
    (result) <- subscribe-weather req
    if (err = result) instanceof Error then res.send 400, "subscribe failed"
    else res.send 200, "success"
    next!

  cancel-subscribe: !(req, res, next)->
    res.send 'cancel subscribe success!'
    next!
