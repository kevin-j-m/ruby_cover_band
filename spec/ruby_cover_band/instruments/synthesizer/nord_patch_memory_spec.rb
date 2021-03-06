module RubyCoverBand
  module Instruments
    class Synthesizer
      RSpec.describe NordPatchMemory do
        describe "#read" do
          it "access the patch stored at the location" do
            a1 = "a1"
            a2 = "a2"
            b1 = "b1"
            b2 = "b2"

            memory = NordPatchMemory.new

            memory.write(location: :a1, patch: a1)
            memory.write(location: :b1, patch: b1)
            memory.write(location: :b2, patch: b2)
            memory.write(location: :a2, patch: a2)

            expect(memory.read(:a1)).to eq a1
            expect(memory.read(:a2)).to eq a2
            expect(memory.read(:b1)).to eq b1
            expect(memory.read(:b2)).to eq b2
          end
        end

        describe "#write" do
          it "stores the patch at the expected location" do
            a1 = "a1"
            a2 = "a2"
            b1 = "b1"
            b2 = "b2"

            memory = NordPatchMemory.new

            memory.write(location: :a1, patch: a1)
            memory.write(location: :b1, patch: b1)
            memory.write(location: :b2, patch: b2)
            memory.write(location: :a2, patch: a2)

            expect(memory.memory).to eq ["a1", "a2", "b1", "b2"]
          end
        end

        describe "#find" do
          it "provides the memory location for the desired patch" do
            patch = Patch.new(sound: :buzz)

            memory = NordPatchMemory.new
            memory.write(location: :b2, patch: patch)

            expect(memory.find(patch)).to eq :b2
          end

          it "returns nil if the patch isn't in memory" do
            patch = Patch.new(sound: :buzz)

            memory = NordPatchMemory.new

            expect(memory.find(patch)).to be_nil
          end
        end
      end
    end
  end
end
