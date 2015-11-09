require "mongo"
require "uri"


uri = 'mongodb://asd:asd@ds049754.mongolab.com:49754/heroku_23mf7s8r'


client = Mongo::Client.new(uri,:user =>"asd",:password => "asd")
puts "Enter primary key from 1 to 100 :"
key1 = gets.chomp()
#result=View.new(:iris,{ sepal_length: '5.1'})
client[:iris].find({ id: "#{key1}"}).each do |data|
  puts "#{data}"
end
