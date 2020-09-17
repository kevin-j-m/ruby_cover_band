module RubyCoverBand
  module Instruments
    class Guitar
      class Fret
        attr_reader :number

        def initialize(number:, string_tuning:)
          @number = number
          @string_tuning = string_tuning
        end

        def note
          @note ||= convert_to_note
        end

        private

        def convert_to_note
          note_progression
            .cycle
            .find
            .with_index { |_, i| i == @number }
        end

        def note_progression
          start_index = notes.index(@string_tuning)
          notes.rotate(start_index)
        end

        def notes
          [
            :c,
            :d_flat,
            :d,
            :e_flat,
            :e,
            :f,
            :g_flat,
            :g,
            :a_flat,
            :a,
            :b_flat,
            :b,
          ]
        end
      end
    end
  end
end
