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
    end
  end
end
