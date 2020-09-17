module RubyCoverBand
  module Instruments
    RSpec.describe Guitar do
      describe "#strum" do
        it "plays all notes on all strings for the specified chord" do
          allow(Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

          guitar = Guitar.new(tuning: :drop_d)
          chord = Guitar::Chords::CHalfBar.new

          expect(guitar.strum(chord)).to eq [nil, :e, :g, :c, :e, nil]
        end
      end

      describe "#tune" do
        it "tunes the guitar to the specified tuning" do
          guitar = Guitar.new
          guitar.tuning = :drop_d

          guitar.tune

          expect(guitar.strings.map(&:tuning_note)).to eq [:d, :a, :d, :g, :b, :e]
        end
      end

      describe "#change_strings" do
        it "provides new strings that aren't tuned to any note" do
          guitar = Guitar.new
          guitar.tune

          expect { guitar.change_strings }
            .to change { guitar.strings.map(&:tuning_note) }
            .from([:e, :a, :d, :g, :b, :e])
            .to([nil, nil, nil, nil, nil, nil])
        end
      end
    end
  end
end
