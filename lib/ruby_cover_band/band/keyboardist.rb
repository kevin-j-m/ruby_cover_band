module RubyCoverBand
  class Band
    class Keyboardist
      attr_reader :synthesizers
      def initialize
        @synthesizers = []
      end

      def add(synth)
        @synthesizers << synth
      end

      def program(note)
        synth = synthesizers.find { |s| s.find(note.synth_sound.patch) }

        if synth
          synth.program(note)
        end
      end
    end
  end
end
