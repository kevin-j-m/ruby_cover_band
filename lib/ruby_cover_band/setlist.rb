module RubyCoverBand
  class Setlist
    attr_reader :band
    attr_reader :lighting
    attr_reader :songs

    def initialize(band)
      @songs = []
      @band = band
    end

    def lighting=(lighting)
      @lighting = lighting

      songs.map { |song| song.lighting = lighting }
    end

    def add_song(song)
      song.performers = band
      song.lighting = lighting
      @songs << song
    end
  end
end
