module RubyCoverBand
  module Instruments
    class Guitar
      attr_reader :strings
      attr_accessor :tuning

      def initialize(tuning: :standard)
        @tuning = tuning
        @strings = []
        change_strings
        tune
      end

      def strum(chord)
        phrasing = []

        phrasing << Thread.new { strings[0].pluck(fret: chord.first_fret) }
        phrasing << Thread.new { strings[1].pluck(fret: chord.second_fret) }
        phrasing << Thread.new { strings[2].pluck(fret: chord.third_fret) }
        phrasing << Thread.new { strings[3].pluck(fret: chord.fourth_fret) }
        phrasing << Thread.new { strings[4].pluck(fret: chord.fifth_fret) }
        phrasing << Thread.new { strings[5].pluck(fret: chord.sixth_fret) }

        phrasing.map(&:value)
      end

      def tune
        if @tuning == :standard
          standard_tuning
        elsif @tuning == :drop_d
          drop_d_tuning
        end
      end

      def change_strings
        @strings.clear

        6.times do
          @strings << Guitar::String.new(nil)
        end
      end

      private

      def standard_tuning
        @strings[0].tune(:e)
        @strings[1].tune(:a)
        @strings[2].tune(:d)
        @strings[3].tune(:g)
        @strings[4].tune(:b)
        @strings[5].tune(:e)
      end

      def drop_d_tuning
        @strings[0].tune(:d)
        @strings[1].tune(:a)
        @strings[2].tune(:d)
        @strings[3].tune(:g)
        @strings[4].tune(:b)
        @strings[5].tune(:e)
      end
    end
  end
end
