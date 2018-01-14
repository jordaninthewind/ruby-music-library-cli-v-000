require 'pry'

class MusicLibraryController
attr_reader :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    choice = gets.chomp
    if choice != 'exit'
      self.call
    end
    # case choice
    # when 'exit'
    #   exit
    # when 'list songs'
    #   Song.all
    # when 'list artists'
    #   Artist.all
    # when 'list genres'
    #   Genre.all
    # when 'list artist'
    #   artist = gets.chomp
    #   Artist.find_by_name(artist)
    # else
    #   self.call
    # end
  end

  def list_songs
    x = Song.all.sort_by { |i| i.name }.uniq
    # binding.pry
    x.each_with_index do |el, i|
      puts "#{i + 1}. #{el.artist.name} - #{el.name} - #{el.genre.name}"
    end
  end

  def list_artists
    x = Artist.all.sort_by { |i| i.name }
    x.each_with_index do |el, i|
      # binding.pry
      puts "#{i + 1}. #{el.name}"
    end
  end

  def list_genres
    x = Genre.all.sort_by { |i| i.name }
    x.each_with_index do |el, i|
      # binding.pry
      puts "#{i + 1}. #{el.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    x = Artist.find_by_name(artist)
    if x != nil
      songs = x.songs.sort_by {|el| el.name}
      binding.pry
      puts ""
    end
  end

end
