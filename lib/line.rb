class Concert
  def initialize(setlist:)
    @setlist = setlist
    @band = band
  end

  def set_up
  end

  def load_out
  end

  def perform
    @setlist.songs.each(&:play)
  end
end
