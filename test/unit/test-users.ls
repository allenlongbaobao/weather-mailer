describe '用户相关行为测试', !->
  before-each: !(done)->
    done!
  describe '注册', !->
    can '用户提供错误的邮箱，服务器返回错误信息', !(done)->
      done!
    can '用户提供错误的用户名，服务器返回错误信息', !(done)->
      done!
    can '用户提供错误的密码，服务器返回错误信息', !(done)->
      done!
    can '用户提供正确的报文， 服务器返回正确的结果', !(done)->
      done!
  describe '登录', !->
    can '用户提供的邮箱未注册，服务器返回错误信息', !(done)->
      done!
    can '用户提供的密码不正确，服务器返回错误信息', !(done)->
      done!
    can '用户提供的邮箱和密码正确， 服务器返回正确信息', !(done)->
      done!
      
  describe '登出', !->
    can '用户在未登录情况下，申请登录， 返回错误信息', !(done)->
      done!
    can '用户在登录情况下，申请登出， 返回正确结果', !(done)->
      done!
    can '用户登出后，不能进行其他操作除了登录', !(done)->
      done!
  #TODO
  describe '修改个人信息', !->
    can '用户在未登录的情况下, 申请修改， 返回错误信息', !(done)->
      done!
