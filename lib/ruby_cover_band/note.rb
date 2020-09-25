module RubyCoverBand
  class Note
    attr_reader :guitar_line
    attr_reader :lighting
    attr_reader :lyric
    attr_reader :beat
    attr_reader :synth_sound
    attr_reader :duration

    def initialize(guitar_line: nil, lyric: nil, beat: nil, synth_sound: nil, duration: 0.25, lighting: nil)
      @guitar_line = guitar_line
      @lyric = lyric
      @beat = beat
      @synth_sound = synth_sound
      @duration = duration
      @lighting = lighting
    end
  end
end
