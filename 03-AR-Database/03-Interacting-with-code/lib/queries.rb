require 'sqlite3'

# opens the database
database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)

def number_of_rows(db, table_name)
  db.execute("SELECT COUNT (*) FROM #{table_name}").first[0]
  #TODO: count number of rows in table table_name
end

def sorted_artists(db)
  db.execute("SELECT name FROM Artist ORDER BY name").flatten
  #TODO: return array of artists' names sorted alphabetically
end

def love_tracks(db)
  db.execute("SELECT name FROM Track WHERE name like '%love%'").flatten
  #TODO: return array of love songs
end

def long_tracks(db, min_length)
  db.execute("SELECT name FROM Track WHERE Milliseconds > (#{min_length}*60000)").flatten
  #TODO: return tracks verifying: duration > min_length (minutes)
end
