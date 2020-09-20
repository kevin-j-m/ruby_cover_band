module RubyCoverBand
  module Instruments
    class Synthesizer
      class Patch
        attr_reader :sound
        attr_reader :effect # flanger, chorus
        attr_reader :filter #highpass, #lowpass
        attr_reader :oscillator #triangle, sawtooth

        def initialize(sound:, effect: nil, filter: nil, oscillator: nil)
          @sound = sound
          @effect = effect
          @filter = filter
          @oscillator = oscillator
        end
      end
    end
  end
end
