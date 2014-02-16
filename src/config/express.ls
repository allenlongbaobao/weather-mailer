require! ['express']

module.exports = !(server)->
  server.set 'port', 4000
  server.get '/', !(req, res) -> res.send path
  server.use express.static __dirname + '/../resource'
  server.set 'view engine', 'jade'

  # 错误处理
  server.use !(err, erq, res, next)->
    debug "something wrong! err: ", err
    res.send 500, "Internal Server Error"
