module RubyCoverBand
  class Song
    attr_reader :name

    def initialize(beats: [], name:, time_between_beats: 0)
      @beats = beats
      @name = name
      @time_between_beats = time_between_beats
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
        sleep(@time_between_beats)
      end
    end
  end
end
