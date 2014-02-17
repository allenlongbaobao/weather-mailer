require! ['http', '../bin/config/config']

options =
  hostname: 'localhost'
  port: config.port
  path: ''
  method: 'GET'

result = ''
get-data-and-callback = !(res, callback)->
  res.set-encoding 'utf-8'
  res.on 'data', !(chunk)->
    result += chunk

  res.on 'end', !->
    result := JSON.parse result
    callback result
    result := ''

  res.on 'error', !(err)->
    console.log err

module.exports =
  get: !(request-data, callback)->
    get-options = options <<< request-data <<< {method: 'GET'}
    req = http.request get-options, !(res)->
      get-data-and-callback res, callback
    req.on 'error', !(err)->
      console.log err
    req.end!

  #TODO
  #post: 
  #del:
  #put:


