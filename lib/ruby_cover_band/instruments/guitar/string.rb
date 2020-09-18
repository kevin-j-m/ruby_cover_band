module RubyCoverBand
  module Instruments
    class Guitar
      class String
        attr_reader :tension
        attr_reader :tuning_note

        def initialize(number:, tuning_note:, amplifier:)
          @number = number
          @tuning_note = tuning_note
          @amplifier = amplifier
          @tension = 100
          @broken = false
        end

        def tune(note)
          @tuning_note = note
        end

        def pluck(fret:)
          return NoStringSound.new unless fret && playable?

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
          StringSound.new(
            string_number: @number,
            tuning_note: tuning_note,
            fret_number: fret_number,
          )
        end

        def break_string
          @broken = true
          BrokenStringSound.new
        end
      end

      class StringPerformance
        def self.exhausted?
          rand(1..100) == 3
        end
      end

      class StringSound
        def initialize(string_number:, tuning_note:, fret_number:)
          @string_number = string_number
          @tuning_note = tuning_note
          @fret_number = fret_number
        end

        def note
          fret.note
        end

        def amp_value
          "(note(:#{playable_note_root}) + #{@fret_number})"
        end

        def play_with_pattern?
          true
        end

        private

        def fret
          @fret ||= Fret.new(number: @fret_number, string_tuning: @tuning_note)
        end

        def playable_note_root
          playable_note_key.dig(@string_number, @tuning_note)
        end

        def playable_note_key
          {
            0 => {
              d: :d2,
              e: :e2,
            },
            1 => {
              a: :a2,
            },
            2 => {
              d: :d3,
            },
            3 => {
              g: :g3
            },
            4 => {
              b: :b3,
            },
            5 => {
              e: :e4,
            },
          }
        end
      end

      class NoStringSound
        def note
          nil
        end

        def amp_value
          nil
        end

        def play_with_pattern?
          false
        end
      end

      class BrokenStringSound
        def note
          nil
        end

        def amp_value
          "sample :elec_pop, amp: 3"
        end

        def play_with_pattern?
          false
        end
      end
    end
  end
end
