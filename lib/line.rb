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

class Setlist
  attr_reader :songs

  def initialize(band)
    @songs = []
    @band = band
  end

  def add_song(song)
    song.performers = band
    @songs << song
  end
end

class Song
  def initialize(bars:, name:)
    @bars = bars
    @name = name
  end

  def performers=(band)
    @guitar = band.guitarist
    @vocal = band.singer
    @drum = band.drummer
    @synth = band.keyboardist
  end

  def play
    @bars.each do |bar|
      composition = []

      composition << Thread.new { @guitar.strum(bar.guitar_chord) }
      composition << Thread.new { @vocal.sing(bar.lyric_line) }
      composition << Thread.new { @drum.hit(bar.percussion_loop) }
      composition << Thread.new { @synth.program(bar.synth_sound) }

      composition.each(&:join)
    end
  end
end
