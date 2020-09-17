module RubyCoverBand
  class Beat
    attr_reader :guitar_chord
    attr_reader :lyric_line
    attr_reader :percussion_loop
    attr_reader :synth_sound

    def initialize(guitar_chord: nil, lyric_line: nil, percussion_loop: nil, synth_sound: nil)
      @guitar_chord = guitar_chord
      @lyric_line = lyric_line
      @percussion_loop = percussion_loop
      @synth_sound = synth_sound
    end
  end
end
