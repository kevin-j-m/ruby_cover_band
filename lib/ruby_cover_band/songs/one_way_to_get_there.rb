module RubyCoverBand
  module Songs
    class OneWayToGetThere < Song
      def initialize
        super(
          name: "One Way To Get There",
          notes: notes,
        )
      end

      private

      def notes
        beeps + boops + whirrs
      end

      def beeps
        [
          Note.new(synth_sound: Instruments::Synthesizer::SynthSound.new(memory_location: :a1, key: 23), duration: 0),
        ] * 1000
      end

      def boops
        [
          Note.new(synth_sound: Instruments::Synthesizer::SynthSound.new(memory_location: :a2, key: 88), duration: 0),
        ]
      end

      def whirrs
        [
          Note.new(synth_sound: Instruments::Synthesizer::SynthSound.new(memory_location: :b2, key: 15), duration: 0),
        ] * 30
      end
    end
  end
end
