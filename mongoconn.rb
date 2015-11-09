#!/usr/bin/ruby


require "mongo"
require "uri"
require "csv"


uri = 'mongodb://asd:asd@ds049754.mongolab.com:49754/heroku_23mf7s8r'


client = Mongo::Client.new(uri,:user =>"asd",:password => "asd")
CSV.foreach(File.path("/home/savan/Desktop/iris.csv")) do |row|


  db = client[:iris].insert_one({ id: row[0], sepal_length: row[1], sepal_width: row[2],petal_length: row[3],petal_width: row[4],species: row[5] })

end

client.close()
