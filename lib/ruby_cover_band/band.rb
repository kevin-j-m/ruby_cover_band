module RubyCoverBand
  class Band
    attr_accessor :guitarist, :singer, :drummer, :keyboardist
    attr_reader :name

    def initialize(name: nil)
      @name = name
    end
  end
end
