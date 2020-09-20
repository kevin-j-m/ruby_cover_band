module RubyCoverBand
  module Instruments
    class Synthesizer
      class SoundBank
        def available_sounds
          SoundBank.instance_methods -
            Object.instance_methods -
            [:available_sounds, :available_sound?, :sound]
        end

        def available_sound?(possible_sound)
          available_sounds.include?(possible_sound)
        end

        def sound(possible_sound)
          if available_sound?(possible_sound)
            public_send(possible_sound)
          end
        end

        def beep
          "beep"
        end

        def boop
          "boop"
        end

        def buzz
          "buzz"
        end

        def whirr
          "whirr"
        end
      end
    end
  end
end
