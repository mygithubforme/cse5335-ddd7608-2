require "mongo"
require "uri"


uri = 'mongodb://asd:asd@ds049754.mongolab.com:49754/heroku_23mf7s8r'


client = Mongo::Client.new(uri,:user =>"asd",:password => "asd")
print "Enter any from 1 to 10 for sepal_length:"
key1 = gets.chomp()
puts "Record with non primary key sepal_length =#{key1}"
#asd=gets.chomp
#result=View.new(:iris,{ sepal_length: '5.1'})
client[:iris].find({ sepal_length: "#{key1}"}).each do |data|
  puts "#{data}"
end
