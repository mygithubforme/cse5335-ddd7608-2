#!/usr/bin/ruby

require 'pg'

begin
    puts "clean"
    con = PG.connect :dbname => 'd7m9vupkqsh6dn', :user => 'cdrdqjgjrwgowi',
        :password => 'M5wrvL38l7Issz3lfJxPA4ZE48', :host => 'ec2-107-21-221-59.compute-1.amazonaws.com'

    user = con.user
    db_name = con.db
    pswd = con.pass

    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{pswd}"
    puts "Enter primary key from 1 to 100"
    key = gets.chomp()

    puts "Output is as follows."


    rs = con.exec "SELECT * FROM Iris WHERE id=#{key}"
    rs.each do |row|
     puts "%s %s %s %s %s %s" % [ row['id'], row['sepal_length'], row['sepal_width'], row['petal_width'], row['petal_length'], row['species'] ]
    end
end
