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
    print "Enter any from 1 to 10 for sepal_length:"
    key=gets.chomp
    puts "Record with non primary key sepal_length =#{key}"
    rs = con.exec "SELECT * FROM Iris WHERE sepal_length='#{key}'"
    rs.each do |row|
     puts "%s %s %s %s %s %s" % [ row['id'], row['sepal_length'], row['sepal_width'], row['petal_width'], row['petal_length'], row['species'] ]
    end
end
