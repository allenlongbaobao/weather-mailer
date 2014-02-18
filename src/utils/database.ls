require! ['mongodb'.Db, 'mongodb'.Server, 'mongodb'.MongoClient, 'mongodb'.ObjectID, '../config']

db = null

init-mongo-client = !(callback)->
  if db
    callback!
  else
    db := new Db config.mongo.db, (new Server config.mongo.host, config.mongo.port), w: config.mongo.write-concern
    (err, db) <-! db.open
    if err then throw err
    <-! load-collections db, config.mongo.collections
    <-! add-index-for-collections
    callback!

load-collections = !(db, collections)->
  db.weather-msger = {}
  for c in collections
    let collection-name = c
      db.weather-msger [collection-name] = db.collection collection-name
  callback!

add-index-for-collections = !(callback)->
  callback!

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

query-collection = !(collection-name, query-obj, callback)->
  (db) <-! get-db
  (err, results) <-! db.weather-msger[collection-name].find query-obj .to-array
  console.log err if err
  throw err if err
  callback results

module.exports =
  get-db: get-db
  shotdown: shotdown-mongo-client
  query-collection: query-collection


