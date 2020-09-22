module RubyCoverBand
  module Instruments
    RSpec.describe Synthesizer do
      describe "#save_patch" do
        it "adds the patch to the synth's memory" do
          synth = Synthesizer.new(brand: :moog)

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          expect(synth.patch_memory.read(:a1)).to eq patch
        end
      end

      describe "#program" do
        it "sets the current patch being used that's needed by the note" do
          synth = Synthesizer.new(brand: :moog)

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          sound = Synthesizer::SynthSound.new(patch: patch, key: 1)
          note = Note.new(synth_sound: sound)

          expect { synth.program(note) }
            .to change { synth.current_patch }
            .from(nil)
            .to(patch)
        end

        it "plays the key for the note" do
          synth = Synthesizer.new(brand: :moog)

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          sound = Synthesizer::SynthSound.new(patch: patch, key: 1)
          note = Note.new(synth_sound: sound)

          expect(synth.program(note)).to eq :a
        end
      end

      describe "#set_patch" do
        it "sets the current patch to that patch when it's in memory" do
          synth = Synthesizer.new(brand: :moog)

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          expect { synth.set_patch(patch) }
            .to change { synth.current_patch }
            .from(nil)
            .to(patch)
        end
      end

      describe "#play_key" do
        it "plays the lowest key" do
          synth = Synthesizer.new(brand: :moog)

          expect(synth.play_key(key: 1, duration: 1)).to eq :a
        end

        it "plays the next octave up" do
          synth = Synthesizer.new(brand: :moog)

          expect(synth.play_key(key: 13, duration: 1)).to eq :a
        end

        it "plays the highest key" do
          synth = Synthesizer.new(brand: :moog)

          expect(synth.play_key(key: 88, duration: 1)).to eq :c
        end
      end

      describe "#find" do
        it "provides the memory location for the desired patch" do
          patch = Synthesizer::Patch.new(sound: :buzz)

          synth = Synthesizer.new(brand: :moog)
          synth.save_patch(location: :b2, patch: patch)

          expect(synth.find(patch)).to eq :b2
        end

        it "returns nil if the patch isn't in memory" do
          patch = Synthesizer::Patch.new(sound: :buzz)

          synth = Synthesizer.new(brand: :moog)

          expect(synth.find(patch)).to be_nil
        end
      end
    end
  end
end
