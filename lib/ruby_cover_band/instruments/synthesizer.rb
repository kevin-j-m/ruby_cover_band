module RubyCoverBand
  module Instruments
    class Synthesizer
      def initialize
        @sound_bank = SoundBank.new
        @patch_memory = {}
      end

      def save_patch(patch)
        @patch_memory[patch.name] = patch
      end

      def program(synth_sound)
      end
    end
  end
end
