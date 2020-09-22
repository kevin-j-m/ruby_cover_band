module RubyCoverBand
  module Instruments
    class Synthesizer
      RSpec.describe Patch do
        describe "#==" do
          it "is equal to another patch with the same characteristics" do
            patch = Patch.new(
              sound: :buzz,
              effect: :flanger,
              filter: :lowpass,
              oscillator: :triangle,
            )

            other_patch = Patch.new(
              sound: :buzz,
              effect: :flanger,
              filter: :lowpass,
              oscillator: :triangle,
            )

            expect(patch == other_patch).to eq true
          end

          it "is not equal to a patch with different characteristics" do
            patch = Patch.new(
              sound: :buzz,
              effect: :flanger,
              filter: :lowpass,
              oscillator: :triangle,
            )

            other_patch = Patch.new(
              sound: :whirr,
              effect: :chorus,
              filter: :highpass,
              oscillator: :sawtooth,
            )

            expect(patch == other_patch).to eq false
          end
        end
      end
    end
  end
end
