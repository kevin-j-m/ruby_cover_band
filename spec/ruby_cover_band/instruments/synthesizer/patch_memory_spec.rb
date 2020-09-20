module RubyCoverBand
  module Instruments
    class Synthesizer
      RSpec.describe PatchMemory do
        describe "#read" do
          it "access the patch stored at the location" do
            a1 = "a1"
            a2 = "a2"
            b1 = "b1"
            b2 = "b2"

            memory = PatchMemory.new

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

            memory = PatchMemory.new

            memory.write(location: :a1, patch: a1)
            memory.write(location: :b1, patch: b1)
            memory.write(location: :b2, patch: b2)
            memory.write(location: :a2, patch: a2)

            expect(memory.memory).to eq ["a1", "a2", "b1", "b2"]
          end
        end
      end
    end
  end
end
