module RubyCoverBand
  class LightingController
    def initialize
      @powered_lights = {}
    end

    def turn_on_lights
      @powered_lights[:beam_projector] = Lighting::BeamProjector.new
      @powered_lights[:can] = Lighting::Can.new
      @powered_lights[:moving_light] = Lighting::MovingLight.new
      @powered_lights[:spotlight] = Lighting::Spotlight.new
    end

    def trigger(lighting_composition)
      @powered_lights[lighting_composition.light].trigger(
        color: lighting_composition.color,
        effect: lighting_composition.effect,
      )
    end
  end
end
