require! ['mongodb'.Db, 'mongodb'.Server, 'mongodb'.MongoClient, 'mongodb'.ObjectID, '../config']

db = null

init-mongo-client = !(callback)->
  if db
    callback!
  else
    db := new Db config.mongo.db, (new Server config.mongo.host, config.mongo.port), w: config.mongo.write-concern
    (err, db) <-! db.open
    if err throw err

get-db = !(callback)->
  if !db
    <-! init-mongo-client
    callback db
  else
    callback db

shotdown-mongo-client = !(callback)->
  db.close!
  db := null
  callback!

module.exports =
  get-db: get-db
  shotdown: shotdown-mongo-client



