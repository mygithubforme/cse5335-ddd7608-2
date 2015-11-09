#!/usr/bin/ruby

require 'pg'
require 'csv'

begin

    con = PG.connect :dbname => 'd7m9vupkqsh6dn', :user => 'cdrdqjgjrwgowi',
        :password => 'M5wrvL38l7Issz3lfJxPA4ZE48', :host => 'ec2-107-21-221-59.compute-1.amazonaws.com'

    user = con.user
    db_name = con.db
    pswd = con.pass

    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{pswd}"

    con.exec "DROP TABLE IF EXISTS Iris"
    con.exec "CREATE TABLE Iris(id INTEGER PRIMARY KEY,sepal_length real, sepal_width real, petal_length real, petal_width real, species VARCHAR(40))"
    CSV.foreach(File.path("C:\\Ruby Projs\\iris.csv")) do |row|
        con.exec "INSERT INTO Iris (id,sepal_length,sepal_width,petal_width,petal_length,species) VALUES (#{row[0]}, #{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, '#{row[5]}')"
    #rs = con.exec "SELECT * FROM Iris"
    #rs.each do |row|
    #  puts "%s %s %s %s %s %s" % [ row['id'], row['sepal_length'], row['sepal_width'], row['petal_length'], row['petal_width'], row['species'] ]
    #end
    end

    puts "Suucess INSERT"

rescue PG::Error => e

    puts e.message

ensure

    con.close if con

end
