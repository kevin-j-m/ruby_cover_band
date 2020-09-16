module RubyCoverBand
  module Instruments
    class Guitar
      RSpec.describe Fret do
        describe "#note" do
          it "plays the string note if no fret is depressed" do
            fret = Fret.new(number: 0, string_tuning: :e)

            expect(fret.note).to eq :e
          end

          it "plays the string note if the twelvth fret is depressed" do
            fret = Fret.new(number: 12, string_tuning: :e)

            expect(fret.note).to eq :e
          end

          it "steps up the number of notes from the string note to the fret number depressed" do
            fret = Fret.new(number: 2, string_tuning: :a)

            expect(fret.note).to eq :b
          end
        end
      end
    end
  end
end
