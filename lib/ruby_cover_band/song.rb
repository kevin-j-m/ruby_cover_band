module RubyCoverBand
  class Song
    def initialize(beats:, name:)
      @beats = beats
      @name = name
    end

    def performers=(band)
      @guitar = band.guitarist
      @vocal = band.singer
      @drum = band.drummer
      @synth = band.keyboardist
    end

    def play
      @beats.map do |beat|
        composition = []

        composition << Thread.new { @guitar&.strum(beat.guitar_chord) }
        composition << Thread.new { @vocal&.sing(beat.lyric_line) }
        composition << Thread.new { @drum&.hit(beat.percussion_loop) }
        composition << Thread.new { @synth&.program(beat.synth_sound) }

        composition.map(&:value)
      end
    end
  end
end
