module RubyCoverBand
  module Instruments
    class Guitar
      class String
        attr_reader :tension
        attr_reader :tuning_note

        def initialize(number:, tuning_note:)
          @number = number
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
          :broken
          # TODO: sonic pi stuff
        end

        def playable_note_root
          playable_note_key.dig(@number, @tuning_note)
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

        # def playable_note
        #   {
        #     low_d: :d2,
        #     low_e: :e2,
        #     a: :a2,
        #     high_d: :d3,
        #     g: :g3,
        #     b: :b3,
        #     high_e: :e4,
        #   }
        # end
      end

      class StringPerformance
        def self.exhausted?
          rand(1..30) == 3
        end
      end
    end
  end
end
