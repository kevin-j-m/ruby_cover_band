module RubyCoverBand
  class Concert
    def initialize(setlist:)
      @setlist = setlist
    end

    # TODO: public API test
    def set_up
      band.guitarist.change_strings
      band.guitarist.tune
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
  end
end
