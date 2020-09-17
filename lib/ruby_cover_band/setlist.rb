module RubyCoverBand
  class Setlist
    attr_reader :band
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
end
