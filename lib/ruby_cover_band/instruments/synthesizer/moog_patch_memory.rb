module RubyCoverBand
  module Instruments
    class Synthesizer
      class MoogPatchMemory
        attr_reader :memory

        def initialize
          @memory = []
        end

        def find(patch)
          location(@memory.index(patch))
        end

        def read(location)
          case location
          when :a1
            @memory[0]
          when :a2
            @memory[1]
          when :b1
            @memory[2]
          when :b2
            @memory[3]
          end
        end

        def write(location:, patch:)
          case location
          when :a1
            @memory[0] = patch
          when :a2
            @memory[1] = patch
          when :b1
            @memory[2] = patch
          when :b2
            @memory[3] = patch
          end
        end

        private

        def location(index)
          return nil unless index

          [:a1, :a2, :b1, :b2][index]
        end
      end
    end
  end
end
