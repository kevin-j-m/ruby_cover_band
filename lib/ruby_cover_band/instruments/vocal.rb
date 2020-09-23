module RubyCoverBand
  module Instruments
    class Vocal
      attr_reader :current_effect, :effect_level

      def initialize
        remove_effect
      end

      def sing(note)
        if note.lyric.effect
          set_effect(note.lyric.effect, level: note.lyric.effect_level)
        else
          remove_effect
        end

        note.lyric.line
      end

      def set_effect(effect, level:)
        @current_effect = effect
        @effect_level = level
      end

      def remove_effect
        @current_effect = nil
        @effect_level = 0
      end
    end
  end
end
