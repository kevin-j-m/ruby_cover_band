module RubyCoverBand
  module Instruments
    class Vocal
      class Lyric
        attr_reader :line
        attr_reader :effect
        attr_reader :effect_level

        def initialize(line:, effect: nil, effect_level: 0)
          @line = line
          @effect = effect
          @effect_level = effect_level
        end
      end
    end
  end
end
