require "ruby_cover_band/instruments/synthesizer/patch"
require "ruby_cover_band/instruments/synthesizer/patch_memory"
require "ruby_cover_band/instruments/synthesizer/sound_bank"

module RubyCoverBand
  module Instruments
    class Synthesizer
      def initialize
        @sound_bank = SoundBank.new
        @patch_memory = PatchMemory.new
      end

      # TODO: patches
      # What to check which patches are used,
      # not the sound bank
      # How am I modeling patches?
      # Or do I change the example to see about removing
      # sounds from the sound bank?
      # Maybe rather than using a hash
      # I represent the memory in a separate object
      # that's basically a hash, but has different access to each
      # element?
      def save_patch(location:, patch:)
        @patch_memory.write(location: location, patch: patch)
      end

      def program(note)
        set_patch(note.synth.something)
        play_key(note.synth.keypress, note.duration)
      end
    end
  end
end
