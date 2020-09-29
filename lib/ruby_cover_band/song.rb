module RubyCoverBand
  class Song
    attr_reader :name

    def initialize(notes: [], name:)
      @notes = notes
      @name = name
    end

    def performers=(band)
      @guitar = band.guitarist
      @vocal = band.singer
      @drum = band.drummer
      @keyboardist = band.keyboardist
    end

    def lighting=(lighting)
      @lighting = lighting
    end

    def play
      @notes.map do |note|
        composition = []

        composition << Thread.new { @guitar&.play(note) }
        composition << Thread.new { @vocal&.sing(note) }
        composition << Thread.new { @drum&.hit(note) }
        composition << Thread.new { @keyboardist&.program(note) }
        composition << Thread.new { @lighting&.trigger(note) }

        sleep(note.duration)
        composition.map(&:value)
      end
    end
  end
end
