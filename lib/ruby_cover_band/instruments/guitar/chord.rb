module RubyCoverBand
  module Instruments
    class Guitar
      class Chord
        def initialize(note)
          @note = note
        end

        def first_fret
          if note == :c
            nil
          elsif note == :b_flat
            nil
          elsif note == :f
            nil
          elsif note == :d
            nil
          end
        end

        def second_fret
          if note == :c
            7
          elsif note == :b_flat
            8
          elsif note == :f
            15
          elsif note == :d
            5
          end
        end

        def third_fret
          if note == :c
            5
          elsif note == :b_flat
            8
          elsif note == :f
            15
          elsif note == :d
            4
          end
        end

        def fourth_fret
          if note == :c
            5
          elsif note == :b_flat
            7
          elsif note == :f
            14
          elsif note == :d
            2
          end
        end

        def fifth_fret
          if note == :c
            5
          elsif note == :b_flat
            6
          elsif note == :f
            13
          elsif note == :d
            3
          end
        end

        def sixth_fret
          if note == :c
            nil
          elsif note == :b_flat
            nil
          elsif note == :f
            nil
          elsif note == :d
            nil
          end
        end
      end
    end
  end
end
