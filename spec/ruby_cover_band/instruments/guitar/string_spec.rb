module RubyCoverBand
  module Instruments
    class Guitar
      RSpec.describe String do
        describe "#tune" do
          it "sets the tuning note to the note provided" do
            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect { string.tune(:b) }
              .to change { string.tuning_note }
              .from(:a)
              .to(:b)
          end
        end

        describe "#pluck" do
          it "does not attempt to play a note if no fret is provided" do
            allow(StringPerformance).to receive(:exhausted?)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            string.pluck(fret: nil)

            expect(StringPerformance).not_to have_received(:exhausted?)
          end

          it "does not attempt to play a note if the string is broken" do
            allow(StringPerformance).to receive(:exhausted?)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)
            string.instance_variable_set(:@broken, true)

            string.pluck(fret: 1)

            expect(StringPerformance).not_to have_received(:exhausted?)
          end

          it "breaks the string if plucking the string removes all tension" do
            allow(StringPerformance).to receive(:exhausted?).and_return(false)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)
            string.instance_variable_set(:@tension, -1)

            expect { string.pluck(fret: 12) }
              .to change { string.broken? }
              .from(false)
              .to(true)
          end

          it "breaks the string if the string performance reports the string is exhausted" do
            allow(StringPerformance).to receive(:exhausted?).and_return(true)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect { string.pluck(fret: 12) }
              .to change { string.broken? }
              .from(false)
              .to(true)
          end

          it "reduces the tension when playing a note" do
            allow(StringPerformance).to receive(:exhausted?).and_return(false)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect { string.pluck(fret: 0) }
              .to change { string.tension }
              .from(100)
              .to(99)
          end

          it "plays the note associated with that fret position for the string" do
            allow(StringPerformance).to receive(:exhausted?).and_return(false)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect(string.pluck(fret: 0).note).to eq :a
          end
        end

        describe "#broken?" do
          it "is not broken for a new string" do
            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect(string.broken?).to eq false
          end

          it "is broken after someone breaks it" do
            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            string.send(:break_string)

            expect(string.broken?).to eq true
          end
        end
      end
    end
  end
end
