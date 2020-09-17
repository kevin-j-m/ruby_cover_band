class Concert
  def initialize(setlist:)
    @setlist = setlist
    @band = band
  end

  def set_up
  end

  def load_out
  end

  def perform
    @setlist.songs.each(&:play)
  end
end

class Setlist
  attr_reader :songs

  def initialize(band)
    @songs = []
    @band = band
  end

  def add_song(song)
    song.performers = band
    @songs << song
  end
end
