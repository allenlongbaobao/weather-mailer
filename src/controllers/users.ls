require! ['../business/users']

module.exports =
  create: !(req, res)->
    (result) <-! users.register req
    if (err = result) instanceof Error then
      res.send {result: 'failed', errors: [err.message]}
    else res.send {result: 'success', errors: []}

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
