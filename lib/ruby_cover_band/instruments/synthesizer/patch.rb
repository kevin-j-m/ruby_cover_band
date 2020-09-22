module RubyCoverBand
  module Instruments
    class Synthesizer
      class Patch
        attr_reader :sound
        attr_reader :effect
        attr_reader :filter
        attr_reader :oscillator

        def initialize(sound:, effect: nil, filter: nil, oscillator: nil)
          @sound = sound
          @effect = effect
          @filter = filter
          @oscillator = oscillator
        end

        def ==(other)
          sound == other.sound &&
            effect == other.effect &&
            filter == other.filter &&
            oscillator == other.oscillator
        end
      end
    end
  end
end
