require! ['../controllers/weather']

module.exports = !(app)->

  # 获取天气信息
  app.get '/get-weather', weather.get-weather
  # 订阅天气
  app.post '/subscribe-weather', weather.subscribe-weather
  # 取消订阅
  app.post '/cancel-subscribe', weather.cancel-subscribe
