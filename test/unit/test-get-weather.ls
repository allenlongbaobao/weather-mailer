describe '获取天气， 返回查询地点的天气信息', !(done)->
  before !(done)->
    done!

  can '用户未登录，服务器响应401', !(done)->
    done!

  can '参数错误， 服务器响应400', !(done)->
    done!

  can '提供地点， 服务器返回对应的天气信息', !(done)->
    done!
