module.exports =
  create: !(req, res)->
    res.end 'create success'

  me: !(req, res)->
    res.end 'me success'

  update: !(req, res)->
    res.end 'update success'

  get: !(req, res)->
    res.end 'get success'

  user: !(req, res)->
    res.end 'user success'

  signout: !(req, res)->
    res.end 'signout success'

  signin: !(req, res)->
    res.end 'signin success'
