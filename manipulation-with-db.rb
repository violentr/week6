
require "dbi"
#DBD::Pg
begin
     # connect to the MySQL server
     dbh = DBI.connect("DBI:Pg:den:localhost", 
	                    "test", "test")
     # get server version string and display it
     puts "Search string in DB"
     title = gets.capitalize!
     sth = dbh.execute("SELECT s.first_name ,b.name FROM Students as s,badges as b,student_badges as sb
          where b.name=#{title} and s.id = sb.student_id and b.id =sb.badge_id")
     
          sth.fetch do |row|
     printf "First_name: %s Badge_name: %s \n", row[0] ,row[1]

      end
     sth.finish
     # row = dbh.select_one("SELECT VERSION()")

     # puts "Server version: " + row[0]
rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code:    #{e.err}"
     puts "Error message: #{e.errstr}"
ensure
     # disconnect from server
     puts "Was connected successfully!!"
     dbh.disconnect if dbh
end
