module RubyCoverBand
  module Instruments
    class Synthesizer
      attr_reader :brand, :current_patch, :patch_memory

      def initialize(brand:)
        @brand = brand
        @patch_memory = initialize_memory
        @current_patch = nil
      end

      def save_patch(location:, patch:)
        @patch_memory.write(location: location, patch: patch)
      end

      def program(note)
        set_patch(note.synth_sound.patch)
        play_key(key: note.synth_sound.key, duration: note.duration)
      end

      def find(patch)
        @patch_memory.find(patch)
      end

      def set_patch(patch)
        return unless patch

        location = find(patch)

        if location
          @current_patch = @patch_memory.read(location)
        end
      end

      def play_key(key:, duration:)
        notes[(key - 1) % 12]
      end

      private

      def initialize_memory
        if @brand == :moog
          MoogPatchMemory.new
        elsif @brand == :nord
          NordPatchMemory.new
        end
      end

      def notes
        [
          :a,
          :b_flat,
          :b,
          :c,
          :d_flat,
          :d,
          :e_flat,
          :e,
          :f,
          :g_flat,
          :g,
          :a_flat,
        ]
      end
    end
  end
end
