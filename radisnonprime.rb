require "redis"
require 'csv'
require "resolv-replace.rb"

radis = Redis.new(:url => "redis://h:p1dv4q35efjgon9s56dur3mi2es@ec2-54-83-199-200.compute-1.amazonaws.com:18479", :host => "ec2-54-83-199-200.compute-1.amazonaws.com", :password => "p1dv4q35efjgon9s56dur3mi2es",:port => "18479"  )
#radis.set("1","bar")
#abs = radis.hgetall
#radis.FLUSHALL
print "Enter any from 1 to 10 for sepal_length:"
key=gets.chomp
puts "Record with non primary key sepal_length =#{key}"
res1= radis.smembers("sepal_length#{key}")
res1.each do |res|
  res=radis.hgetall("#{res}")
  puts "#{res}"
end
#ab1 = radis.INFO

#puts "#{abs}"
