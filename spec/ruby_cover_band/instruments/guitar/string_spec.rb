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
            Mocktail.replace(StringPerformance)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            string.pluck(fret: nil)

            verify(times: 0) { StringPerformance.exhausted? }
          end

          it "does not attempt to play a note if the string is broken" do
            Mocktail.replace(StringPerformance)

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)
            string.instance_variable_set(:@broken, true)

            string.pluck(fret: 1)

            verify(times: 0) { StringPerformance.exhausted? }
          end

          it "breaks the string if plucking the string removes all tension" do
            Mocktail.replace(StringPerformance)
            stubs { StringPerformance.exhausted? }.with { false }

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)
            string.instance_variable_set(:@tension, -1)

            expect { string.pluck(fret: 12) }
              .to change { string.broken? }
              .from(false)
              .to(true)

            verify(times: 0) { StringPerformance.exhausted? }
          end

          it "breaks the string if the string performance reports the string is exhausted" do
            Mocktail.replace(StringPerformance)
            stubs { StringPerformance.exhausted? }.with { true }

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect { string.pluck(fret: 12) }
              .to change { string.broken? }
              .from(false)
              .to(true)

            verify(times: 1) { StringPerformance.exhausted? }
          end

          it "reduces the tension when playing a note" do
            Mocktail.replace(StringPerformance)
            stubs { StringPerformance.exhausted? }.with { false }

            string = String.new(number: 1, tuning_note: :a, amplifier: PracticeAmplifier.new)

            expect { string.pluck(fret: 0) }
              .to change { string.tension }
              .from(1000)
              .to(999)
          end

          it "plays the note associated with that fret position for the string" do
            Mocktail.replace(StringPerformance)
            stubs { StringPerformance.exhausted? }.with { false }

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
