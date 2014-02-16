email = require 'mailer'

option =
  ssl: true
  host : "smtp.qq.com" #发送 smtp.qq.com，接收 pop.qq.com
  domain : "[113.108.133.58]" #可以在浏览器中输入 http://ip.qq.com/ 得到
  from : "415619323@qq.com"
  #to : "cathychechang@vip.qq.com"
  #to : "316246961@qq.com"
  to : "1061050073@qq.com"
  subject : "龙宝宝的温馨天气预报"
  reply_to: "cathychechang@vip.qq.com"
  body: "Hello! This is a test of the node_mailer."
  authentication : "login"
  username : "415619323@qq.com"
  password : "ksda21064711"
  debug: true

mail-sender = !(body)->
  option.body = body

mail-sender.prototype.send = !->
  (err) <-! email.send option
  if err then console.log "the err: ", err

module.exports =
  mail-sender: mail-sender
