module RubyCoverBand
  module Instruments
    class Guitar
      attr_reader :strings
      attr_accessor :tuning

      def initialize(tuning: :standard, amplifier:)
        @tuning = tuning
        @amplifier = amplifier
        @strings = []
        change_strings
        tune
      end

      def strum(chord)
        phrasing = [
          strings[0].pluck(fret: chord.first_fret),
          strings[1].pluck(fret: chord.second_fret),
          strings[2].pluck(fret: chord.third_fret),
          strings[3].pluck(fret: chord.fourth_fret),
          strings[4].pluck(fret: chord.fifth_fret),
          strings[5].pluck(fret: chord.sixth_fret),
        ]

        puts "play_pattern_timed [#{phrasing.map(&:amp_value).compact.join(", ")}], 0.1"
        @amplifier.play("play_pattern_timed [#{phrasing.map(&:amp_value).compact.join(", ")}], 0.1")

        phrasing.map(&:note)
        # phrasing = []
        #
        # phrasing << Thread.new { strings[0].pluck(fret: chord.first_fret) }
        # phrasing << Thread.new { strings[1].pluck(fret: chord.second_fret) }
        # phrasing << Thread.new { strings[2].pluck(fret: chord.third_fret) }
        # phrasing << Thread.new { strings[3].pluck(fret: chord.fourth_fret) }
        # phrasing << Thread.new { strings[4].pluck(fret: chord.fifth_fret) }
        # phrasing << Thread.new { strings[5].pluck(fret: chord.sixth_fret) }
        #
        # phrasing.map(&:value)
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

        6.times do |string_number|
          @strings << Guitar::String.new(
            number: string_number,
            tuning_note: nil,
            amplifier: @amplifier,
          )
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
