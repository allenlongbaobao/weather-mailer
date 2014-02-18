describe '获取天气， 返回查询地点的天气信息', !(done)->
  get-weather-url = '/get-weather'
  before !(done)->
    done!

  can '用户未登录，服务器响应401', !(done)->
    done!

  can '参数错误， 服务器响应400', !(done)->
    done!

  can '提供地点， 服务器返回对应的天气信息', !(done)->
    request-data = {path: get-weather-url + '?location=广州'}
    helper.get request-data, !(data)->
      data.should.have.property 'result'
      data.should.have.property 'weatherinfo'
      data.result.should.eql 'success'
      data.weatherinfo.should.have.property 'city'
      data.weatherinfo.should.have.property 'cityid'
      data.weatherinfo.should.have.property 'weather'
      done!

  can '当提供的地点无法查询时， 服务器响应402', !(done)->

    done!
