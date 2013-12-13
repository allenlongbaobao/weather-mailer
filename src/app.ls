require! ['express', 'http', './mail-module', './weather-parse-module']

app = express!

app.set 'port', 4000

app.get '/', !(req, res)->
  res.send 'hello'

get-weather = !->
  options =
    hostname: 'www.weather.com.cn'
    port: 80
    path: '/data/cityinfo/101280102.html'
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

send-mail = (weather-info)->
  console.log weather-info
  useful-info = weather-parse-module.get-useful-info weather-info.weatherinfo
  message = create-message useful-info
  mail-sender = new mail-module.mail-sender message 
  mail-sender.send!

create-message = (useful-info)->
  message = useful-info.city + "今天的天气为："+  useful-info.weather + " 最低温度：" + useful-info.temp1 + ", 最高温度： " + useful-info.temp2 

<-! http.create-server(app).listen app.get 'port'
console.log 'Express sever listening on port ' + app.get 'port'

get-weather!
<-! set-interval _, 1000*3600*12
get-weather!
