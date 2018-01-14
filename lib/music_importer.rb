require 'pry'

class MusicImporter
attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select{|i| i.split(".")[-1] == "mp3"}
  end

end
