module RubyCoverBand
  module Songs
    class TheLineBeginsToBlur < Song
      def initialize
        super(name: "The Line Begins To Blur", notes: chorus)
      end

      private

      def chorus
        chorus_chords.each_with_object([]) do |chord, chorus|
          8.times { chorus << chorus_strum(chord) }
        end
      end

      def chorus_strum(chord)
        RubyCoverBand::Note.new(guitar_line: chord, duration: 0.5)
      end

      def chorus_chords
        [
          RubyCoverBand::Instruments::Guitar::Chords::CHalfBar.new,
          RubyCoverBand::Instruments::Guitar::Chords::BFlatHalfBar.new,
          RubyCoverBand::Instruments::Guitar::Chords::FHalfBar.new,
          RubyCoverBand::Instruments::Guitar::Chords::DHalfBar.new,
        ]
      end
    end
  end
end
