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
        beeps + boops + whirrs + buzzes
      end

      def beeps
        [
          Note.new(
            synth_sound: Instruments::Synthesizer::SynthSound.new(patch: Instruments::Synthesizer::Patch.new(sound: :beep), key: 23),
            duration: 0
          ),
        ] * 1000
      end

      def boops
        [
          Note.new(
            synth_sound: Instruments::Synthesizer::SynthSound.new(patch: Instruments::Synthesizer::Patch.new(sound: :boop), key: 88),
            duration: 0
          ),
        ]
      end

      def buzzes
        [
          Note.new(
            synth_sound: Instruments::Synthesizer::SynthSound.new(patch: Instruments::Synthesizer::Patch.new(sound: :buzz), key: 23),
            duration: 0
          ),
        ] * 42
      end

      def whirrs
        [
          Note.new(
            synth_sound: Instruments::Synthesizer::SynthSound.new(patch: Instruments::Synthesizer::Patch.new(sound: :whirr), key: 15),
            duration: 0
          ),
        ] * 30
      end
    end
  end
end
