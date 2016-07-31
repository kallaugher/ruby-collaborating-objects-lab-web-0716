class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{self.path}/*.mp3")
    files.collect {|file| file.split("/").last}
  end

  def import
    files.collect {|filename| Song.new_by_filename(filename)}
  end
end