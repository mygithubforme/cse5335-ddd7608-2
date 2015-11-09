#!/usr/bin/ruby

require "redis"
require 'csv'

radis = Redis.new(:url => "redis://h:p1dv4q35efjgon9s56dur3mi2es@ec2-54-83-199-200.compute-1.amazonaws.com:18479", :host => "ec2-54-83-199-200.compute-1.amazonaws.com", :password => "p1dv4q35efjgon9s56dur3mi2es",:port => "18479" )
#radis.set("1","bar")
#abs = radis.hgetall
radis.FLUSHALL

CSV.foreach(File.path("/home/savan/Desktop/iris.csv")) do |row|
  #  con.exec "INSERT INTO Iris (id,sepal_length,sepal_width,petal_width,petal_length,species) VALUES (#{row[0]}, #{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, '#{row[5]}')"
#rs = con.exec "SELECT * FROM Iris"
#rs.each do |row|
  #puts "%s %s %s %s %s %s" % [ row['id'], row['sepal_length'], row['sepal_width'], row['petal_length'], row['petal_width'], row['species'] ]
#end
  radis.hmset("#{row[0]}","sepal_length","#{row[1]}","sepal_width","#{row[2]}","petal_length","#{row[3]}","petal_width","#{row[4]}", "species", "#{row[5]}")
  radis.sadd("sepal_length"+"#{row[1]}","#{row[0]}")
  radis.sadd("sepal_width"+"#{row[2]}","#{row[0]}")
  radis.sadd("petal_length"+"#{row[3]}","#{row[0]}")
  radis.sadd("petal_width"+"#{row[4]}","#{row[0]}")
  radis.sadd("species"+"#{row[5]}","#{row[0]}")
end
ab1 = radis.INFO
puts "#{ab1}"
radis.quit
#puts "#{abs}"
