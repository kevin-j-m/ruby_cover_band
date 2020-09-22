module RubyCoverBand
  class Band
    RSpec.describe Keyboardist do
      describe "#add" do
        it "adds the synthesizer to the keyboardist's rig" do
          k = Band::Keyboardist.new

          synth = Instruments::Synthesizer.new(brand: :nord)

          expect { k.add(synth) }
            .to change { k.synthesizers.size }
            .from(0)
            .to(1)
        end
      end

      describe "#program" do
        it "plays the note when it finds the patch" do
          k = Band::Keyboardist.new

          synth = Instruments::Synthesizer.new(brand: :nord)
          patch = Instruments::Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)
          k.add(synth)

          sound = Instruments::Synthesizer::SynthSound.new(patch: patch, key: 1)
          note = Note.new(synth_sound: sound)

          expect(k.program(note)).to eq :a
        end

        it "plays nothing when it can't find the patch" do
          k = Band::Keyboardist.new

          synth = Instruments::Synthesizer.new(brand: :nord)
          k.add(synth)

          patch = Instruments::Synthesizer::Patch.new(sound: :buzz)
          sound = Instruments::Synthesizer::SynthSound.new(patch: patch, key: 1)
          note = Note.new(synth_sound: sound)

          expect(k.program(note)).to be_nil
        end
      end
    end
  end
end
