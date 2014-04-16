# Encoding: utf-8
require 'csv'


def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  film = []
  CSV.foreach(file_name, encoding: "iso-8859-1:UTF-8") do |row|
  film_info = {
    name: row[0],
    year: row[1],
    earnings: row[2]
  }
  film << film_info
  end
  film
end

puts most_successfull(10, 1975, "lib/movies.csv")