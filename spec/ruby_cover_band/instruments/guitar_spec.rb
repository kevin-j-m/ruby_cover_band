module RubyCoverBand
  module Instruments
    RSpec.describe Guitar do
      describe "#play" do
        it "strums the guitar when a chord is provided" do
          allow(Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

          guitar = Guitar.new(tuning: :drop_d, amplifier: PracticeAmplifier.new)
          chord = Guitar::Chords::CHalfBar.new

          expect(guitar.play(chord)).to eq [nil, :e, :g, :c, :e, nil]
        end

        it "picks a string when a finger placement is provided" do
          allow(Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

          guitar = Guitar.new(amplifier: PracticeAmplifier.new)
          placement = Guitar::FingerPlacement.new(string_number: 0, fret: 3)

          expect(guitar.play(placement)).to eq :g
        end
      end

      describe "#pick" do
        it "plays the expected note based on the finger placement on the fretboard" do
          allow(Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

          guitar = Guitar.new(amplifier: PracticeAmplifier.new)
          placement = Guitar::FingerPlacement.new(string_number: 0, fret: 3)

          expect(guitar.pick(placement)).to eq :g
        end
      end

      describe "#strum" do
        it "plays all notes on all strings for the specified chord" do
          allow(Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

          guitar = Guitar.new(tuning: :drop_d, amplifier: PracticeAmplifier.new)
          chord = Guitar::Chords::CHalfBar.new

          expect(guitar.strum(chord)).to eq [nil, :e, :g, :c, :e, nil]
        end
      end

      describe "#tune" do
        it "tunes the guitar to the specified tuning" do
          guitar = Guitar.new(amplifier: PracticeAmplifier.new)
          guitar.tuning = :drop_d

          guitar.tune

          expect(guitar.strings.map(&:tuning_note)).to eq [:d, :a, :d, :g, :b, :e]
        end
      end

      describe "#change_strings" do
        it "provides new strings that aren't tuned to any note" do
          guitar = Guitar.new(amplifier: PracticeAmplifier.new)
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
