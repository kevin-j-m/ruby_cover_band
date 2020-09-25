module RubyCoverBand
  class Concert
    def initialize(venue)
      @venue = venue
    end

    def setlist=(setlist)
      @setlist = setlist
    end

    def set_up
      band.guitarist&.change_strings
      band.guitarist&.tune
      lighting&.turn_on_lights
    end

    def load_out
    end

    def perform
      @setlist.songs.map(&:play)
    end

    private

    def band
      @setlist.band
    end

    def lighting
      @setlist.lighting
    end
  end
end
