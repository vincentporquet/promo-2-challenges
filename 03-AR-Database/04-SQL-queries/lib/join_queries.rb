require 'sqlite3'

# opens the database
DATABASE_PATH = "db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  db.execute("SELECT Track.name, Title, Artist.name
    FROM Track INNER JOIN Album ON track.AlbumID=Album.AlbumId
    INNER JOIN Artist ON Album.ArtistId=Artist.ArtistId")

  # TODO: return the list of tracks with their album and artist
end

def stats_on(db, category)
  stat = db.execute("SELECT Genre.name, COUNT(track.TrackId), AVG(track.Milliseconds/60000)
    FROM Track
    INNER JOIN Genre
    ON Genre.GenreId = track.GenreId
    WHERE Genre.name = '#{category}'").flatten

  stats = {category: stat[0],
    number_of_songs: stat[1],
    avg_length: stat[2]
  }
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
end

def top_five_rock_artists(db)
  db.execute("SELECT Artist.name, COUNT(Track.Title) AS TrackCount
    FROM Artist
    JOIN Album ON Album.ArtistId == Artist.ArtistId
    JOIN Track ON Album.AlbumId == Track.AlbumId
    JOIN Genre ON Genre.GenreId == Track.GenreId
    WHERE Genre.name == 'Rock'
    GROUP BY Artist.name
    ORDER BY TrackCount DESC
    LIMIT O, 5")

  #TODO: return list of top 5 rock artists
end

p stats_on(db,"Rock")