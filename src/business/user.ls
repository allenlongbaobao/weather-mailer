db = require '../utils/database'

register = !(request-data, callback)->
  (check-result) <-! check-user-existed request-data
  unless (check-err = check-result) instanceof Error
    (result) <-! db.save-single-document-in-database 'users', request-data
    callback result
  else callback check-err


module.exports =
  register: register

