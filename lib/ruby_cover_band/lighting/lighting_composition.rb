module RubyCoverBand
  module Lighting
    class LightingComposition
      attr_reader :light
      attr_reader :color
      attr_reader :effect

      def initialize(light:, color: :white, effect: :solid)
        @light = light
        @color = color
        @effect = effect
      end
    end
  end
end
