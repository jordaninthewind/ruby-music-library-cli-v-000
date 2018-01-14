require 'pry'

class MusicImporter
attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    # binding.pry
    Dir.entries(@path).select{|i| i.split(".")[-1] == "mp3"}
  end

end
