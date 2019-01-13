class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @mp3s = Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")}
  end
  #@mp3s only necessary if calling the saved array later. Otherwise return value will be enough for #import
  def import
    files.each{|file| Song.new_by_filename(file)}
  end
end