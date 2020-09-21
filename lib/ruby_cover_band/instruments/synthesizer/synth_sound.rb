module RubyCoverBand
  module Instruments
    class Synthesizer
      class SynthSound
        attr_reader :memory_location
        attr_reader :key

        def initialize(memory_location:, key:)
          @memory_location = memory_location
          @key = key
        end
      end
    end
  end
end
