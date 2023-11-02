const MongoClient = require('mongodb').MongoClient

let cachedDb = null

const uri = process.env.MONGODB_URI

module.exports = async () => {
  if (cachedDb) return cachedDb

  const client = await MongoClient.connect("mongodb://" + uri + ":27017", { useNewUrlParser: true, useUnifiedTopology: true })

  const db = await client.db(new URL("mongodb://" + uri + ":27017/big5").pathname.substr(1))

  cachedDb = db

  return db
}
