class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    new_song = Song.new(filename.split(" - ")[1])
    artist_name = filename.split(" - ")[0]

    # checks to see if the artist has already been created
    new_song_artist = Artist.all.detect{|artist| artist.name == artist_name}
    
    # if artist already exists, add song
    if new_song_artist
      new_song_artist.add_song(new_song)

    # if artist does not exist, create artist, add song, and save instance of artist
    else
      new_song.artist = Artist.new(filename.split(" - ")[0])
      new_song.artist.add_song(new_song)
      new_song.artist.save
    end
    new_song
  end

  def artist=(artist)
    @artist = artist
  end

end