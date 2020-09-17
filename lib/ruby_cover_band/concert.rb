module RubyCoverBand
  class Concert
    def initialize(setlist:)
      @setlist = setlist
    end

    def set_up
    end

    def load_out
    end

    def perform
      @setlist.songs.map(&:play)
    end
  end
end
