class Artist
  attr_accessor :name, :songs
  attr_reader :names

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
    if self.all.detect {|artist| artist.name} == false
      Artist.new(name)
    else
      self.all.detect {|artist| artist.name}
    end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end


end