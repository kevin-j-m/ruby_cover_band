module RubyCoverBand
  module Songs
    class BranchesBones < Song
      def initialize
        super(
          name: "Branches/Bones",
          notes: verse_1 + chorus(0) + verse_2 + chorus(1) + outro,
        )
      end

      private

      def verse_1
        [
          Note.new(lyric: Instruments::Vocal::Lyric.new(line: "Still can make out pieces with the opening sewed shut")),
        ]
      end

      def verse_2
        [
          Note.new(lyric: Instruments::Vocal::Lyric.new(line: "Cold and black and infinite, with nothing left to lose")),
        ]
      end

      def outro
        [
          Note.new(lyric: Instruments::Vocal::Lyric.new(line: "Yes, I have been here before")),
        ]
      end

      # TODO: should pass in 1 and 2 to be "correct", but instead
      # passing in 0 & 1
      def chorus(number)
        echo_intensity = number.positive? && number.even? ? 10 : 30

        lines = [
          "Feels like I've been here before",
          "Yeah, I don't know anymore",
          "And I don't care anymore",
        ]

        lines << (echo_intensity == 10 ? "Feels like I've been here before" : "I think I recognize")

        lines.map do |line|
          Note.new(lyric: Instruments::Vocal::Lyric.new(line: line, effect: :echo, effect_level: echo_intensity))
        end
      end
    end
  end
end
