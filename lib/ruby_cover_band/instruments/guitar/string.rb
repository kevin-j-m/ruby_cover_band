module RubyCoverBand
  module Instruments
    class Guitar
      class String
        attr_reader :tension
        attr_reader :tuning_note

        def initialize(tuning_note)
          @tuning_note = tuning_note
          @tension = 100
          @broken = false
        end

        def tune(note)
          @tuning_note = note
        end

        def pluck(fret:)
          return unless fret && playable?

          if exhausted?
            break_string
          else
            @tension -= 1
            play_note(fret)
          end
        end

        def broken?
          @broken
        end

        private

        def exhausted?
          @tension.negative? || StringPerformance.exhausted?
        end

        def playable?
          !@broken
        end

        def play_note(fret_number)
          fret = Fret.new(number: fret_number, string_tuning: tuning_note)

          fret.note
          # TODO: sonic pi stuff
        end

        def break_string
          @broken = true
          # TODO: sonic pi stuff
        end
      end

      class StringPerformance
        def self.exhausted?
          rand(1..5) == 3
        end
      end
    end
  end
end
