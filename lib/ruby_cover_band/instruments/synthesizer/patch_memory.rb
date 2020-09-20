module RubyCoverBand
  module Instruments
    class Synthesizer
      class PatchMemory
        attr_reader :memory

        def initialize
          @memory = []
        end

        def read(location)
          @memory[index(location)]
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

        def index(location)
          if location == :a1
            0
          elsif location == :a2
            1
          elsif location == :b1
            2
          elsif location == :b2
            3
          end
        end
      end
    end
  end
end
