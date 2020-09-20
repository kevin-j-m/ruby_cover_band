module RubyCoverBand
  module Instruments
    class Synthesizer
      RSpec.describe SoundBank do
        describe "#available_sounds" do
          it "provides all available sounds in the bank" do
            bank = SoundBank.new

            expect(bank.available_sounds).to match_array [:beep, :boop, :buzz, :whirr]
          end
        end

        describe "#available_sound?" do
          it "is true for an available sound" do
            bank = SoundBank.new

            expect(bank.available_sound?(:buzz)).to eq true
          end

          it "is false for a sound the bank doesn't know about" do
            bank = SoundBank.new

            expect(bank.available_sound?(:whistle)).to eq false
          end
        end

        describe "#sound" do
          it "provides the sound for an available sound" do
            bank = SoundBank.new

            expect(bank.sound(:beep)).to eq "beep"
          end

          it "is silent for a sound it doesn't know about" do
            bank = SoundBank.new

            expect(bank.sound(:whistle)).to be_nil
          end
        end
      end
    end
  end
end
