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
      @synth = band.keyboardist
    end

    def play
      @notes.map do |note|
        composition = []

        composition << Thread.new { @guitar&.strum(note.guitar_line) }
        composition << Thread.new { @vocal&.sing(note.lyric) }
        composition << Thread.new { @drum&.hit(note.beat) }
        composition << Thread.new { @synth&.program(note.synth_sound) }

        sleep(note.duration)
        composition.map(&:value)
      end
    end
  end
end
