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

      def play(note)
        public_send(
          note.guitar_line.operation,
          note.guitar_line,
          duration: note.duration,
        )
      end

      def strum(chord, duration: 1)
        phrasing = [
          strings[0].pluck(fret: chord.first_fret),
          strings[1].pluck(fret: chord.second_fret),
          strings[2].pluck(fret: chord.third_fret),
          strings[3].pluck(fret: chord.fourth_fret),
          strings[4].pluck(fret: chord.fifth_fret),
          strings[5].pluck(fret: chord.sixth_fret),
        ]

        phrasing.select { |s| !s.play_in_pattern? && s.amp_value }.each do |sound|
          @amplifier.play(sound_output(sound.amp_value, duration: 1))
        end

        pattern_notes = phrasing.select(&:play_in_pattern?).map(&:amp_value).compact
        @amplifier.play(sound_output("play_pattern_timed [#{pattern_notes.join(", ")}], 0.05", duration: duration))

        phrasing.map(&:note)
      end

      def pick(finger_placement, duration: 1)
        result = strings[finger_placement.string_number].pluck(fret: finger_placement.fret)

        if result.makes_sound?
          @amplifier.play(sound_output("play #{result.amp_value}", duration: duration))
        end

        result.note
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

      def sound_output(play_operation, duration: 1)
        [
          "with_synth :pluck do",
          "#{play_operation}, release: #{duration}",
          "end",
        ].join("\n").strip
      end

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
