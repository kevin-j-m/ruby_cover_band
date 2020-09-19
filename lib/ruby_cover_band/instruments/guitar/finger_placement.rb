module RubyCoverBand
  module Instruments
    class Guitar
      class FingerPlacement
        attr_reader :fret
        attr_reader :string_number

        def initialize(string_number:, fret:)
          @string_number = string_number
          @fret = fret
        end

        def operation
          :pick
        end
      end
    end
  end
end
