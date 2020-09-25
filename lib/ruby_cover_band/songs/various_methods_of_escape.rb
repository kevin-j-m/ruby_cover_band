module RubyCoverBand
  module Songs
    class VariousMethodsOfEscape < Song
      def initialize
        super(
          name: "Various Methods of Escape",
          notes: verse + chorus + verse + chorus,
        )
      end

      private

      def verse
        [
          Note.new(lighting: Lighting::LightingComposition.new(light: :spotlight)),
          Note.new(lighting: Lighting::LightingComposition.new(light: :fresnel)),
        ]
      end

      def chorus
        [
          Note.new(lighting: Lighting::LightingComposition.new(light: :moving_light)),
          Note.new(lighting: Lighting::LightingComposition.new(light: :moving_light, effect: :strobe, color: :blue)),
          Note.new(lighting: Lighting::LightingComposition.new(light: :moving_light, effect: :sparkle, color: :green)),
        ]
      end
    end
  end
end
