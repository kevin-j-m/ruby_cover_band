module RubyCoverBand
  module Songs
    class TheLineBeginsToBlur < Song
      def initialize
        super(
          name: "The Line Begins To Blur",
          notes: chorus + solo,
        )
      end

      private

      def chorus
        chorus_chords.each_with_object([]) do |chord, chorus|
          8.times { chorus << strum(chord) }
        end
      end

      def strum(chord)
        Note.new(guitar_line: chord, duration: 0.5)
      end

      def chorus_chords
        [
          Instruments::Guitar::Chords::CHalfBar.new,
          Instruments::Guitar::Chords::BFlatHalfBar.new,
          Instruments::Guitar::Chords::FHalfBar.new,
          Instruments::Guitar::Chords::DHalfBar.new,
        ]
      end

      def solo
        solo_line_1 + solo_line_2 + solo_line_1 + solo_line_4
      end

      def solo_line_1
        [
          Note.new(guitar_line: fingering(string_number: 1, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 1, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 1, fret: 8), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 1, fret: 7), duration: 1.5),
        ]
      end

      def solo_line_2
        [
          Note.new(guitar_line: fingering(string_number: 1, fret: 5), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 1, fret: 8), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 2, fret: 5), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 2, fret: 7), duration: 3),
        ]
      end

      def solo_line_4
        [
          Note.new(guitar_line: fingering(string_number: 1, fret: 5), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
          Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
        ]
      end

      def outro
        solo_line_1 +
          solo_line_2 +
          solo_line_1 +
          [
            Note.new(guitar_line: fingering(string_number: 1, fret: 5), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            Note.new(guitar_line: fingering(string_number: 3, fret: 7), duration: 0.5),
            strum(Instruments::Guitar::Chords::DropDLowD.new),
        ]
      end

      def fingering(string_number:, fret:)
        Instruments::Guitar::FingerPlacement.new(string_number: string_number, fret: fret)
      end
    end
  end
end
