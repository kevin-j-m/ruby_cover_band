module RubyCoverBand
  module Instruments
    RSpec.describe Synthesizer do
      describe "#save_patch" do
        it "adds the patch to the synth's memory" do
          synth = Synthesizer.new

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          expect(synth.patch_memory.read(:a1)).to eq patch
        end
      end

      describe "#program" do
        it "sets the current patch being used that's needed by the note" do
          synth = Synthesizer.new

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          sound = Synthesizer::SynthSound.new(memory_location: :a1, key: 1)
          note = Note.new(synth_sound: sound)

          expect { synth.program(note) }
            .to change { synth.current_patch }
            .from(nil)
            .to(patch)
        end

        it "plays the key for the note" do
          synth = Synthesizer.new

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          sound = Synthesizer::SynthSound.new(memory_location: :a1, key: 1)
          note = Note.new(synth_sound: sound)

          expect(synth.program(note)).to eq :a
        end
      end

      describe "#set_patch" do
        it "sets the current patch to what is in that memory location" do
          synth = Synthesizer.new

          patch = Synthesizer::Patch.new(sound: :buzz)
          synth.save_patch(location: :a1, patch: patch)

          expect { synth.set_patch(:a1) }
            .to change { synth.current_patch }
            .from(nil)
            .to(patch)
        end
      end

      describe "#play_key" do
        it "plays the lowest key" do
          synth = Synthesizer.new

          expect(synth.play_key(key: 1, duration: 1)).to eq :a
        end

        it "plays the next octave up" do
          synth = Synthesizer.new

          expect(synth.play_key(key: 13, duration: 1)).to eq :a
        end

        it "plays the highest key" do
          synth = Synthesizer.new

          expect(synth.play_key(key: 88, duration: 1)).to eq :c
        end
      end
    end
  end
end
