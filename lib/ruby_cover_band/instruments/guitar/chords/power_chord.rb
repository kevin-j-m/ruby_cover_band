module RubyCoverBand
  module Instruments
    class Guitar
      module Chords
        class PowerChord
          def initialize(string_number:, fret_number:)
            @string_number = string_number
            @fret_number = fret_number
          end

          def first_fret
            if @string_number.zero?
              @fret_number
            else
              nil
            end
          end

          def second_fret
            if @string_number.zero?
              @fret_number + 2
            elsif @string_number == 1
              @fret_number
            else
              nil
            end
          end

          def third_fret
            if @string_number == 1
              @fret_number + 2
            else
              nil
            end
          end

          def fourth_fret
            nil
          end

          def fifth_fret
            nil
          end

          def sixth_fret
            nil
          end

        end
      end
    end
  end
end
