require! ['../controllers/users', '../utils/database']

module.exports = !(app)->

  app.post '/users', users.create

  app.get '/users/me', users.me
  app.put '/users/me', users.update
  app.get '/users/:userId', users.get

  # 自动匹配
  app.param 'userId', users.user

  app.del '/users/session', users.signout
  app.post '/users/session', users.signin
