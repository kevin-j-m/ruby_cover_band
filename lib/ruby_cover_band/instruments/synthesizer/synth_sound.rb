module RubyCoverBand
  module Instruments
    class Synthesizer
      class SynthSound
        attr_reader :patch
        attr_reader :key

        def initialize(patch:, key:)
          @patch = patch
          @key = key
        end
      end
    end
  end
end
