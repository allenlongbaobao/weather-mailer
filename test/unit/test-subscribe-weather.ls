describe '订阅天气测试', !(done)->
  method = '/subscribe-weather'
  before-each !(done)->
    done!


  can '用户未登录， 服务器响应401', !(done)->
    done!

  can '用户选择邮箱订阅， 邮箱格式错误， 返回错误信息', !(done)->
    done!

  can '用户选择邮箱订阅， 邮箱格式正确， 返回成功订阅信息', !(done)->
    url = base-url + method
    request-data =
      location: '广州'
      push-type: ['email']
    request.post url, {form: request-data}, !(err, res, body)->
      done!

  can '用户邮箱成功订阅后， 能够收到天气内容', !(done)->
    done!
