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

class Guitar
  def initialize(tuning: :standard)
    @tuning = tuning
    @strings = Array.new(6, GuitarString.new(nil))
    tune_guitar
  end

  def strum(chord)
    phrasing = []

    phrasing << Thread.new { @strings[0].pluck(fret: chord.first_fret) }
    phrasing << Thread.new { @strings[1].pluck(fret: chord.second_fret) }
    phrasing << Thread.new { @strings[2].pluck(fret: chord.third_fret) }
    phrasing << Thread.new { @strings[3].pluck(fret: chord.fourth_fret) }
    phrasing << Thread.new { @strings[4].pluck(fret: chord.fifth_fret) }
    phrasing << Thread.new { @strings[5].pluck(fret: chord.sixth_fret) }

    phrasing.each(&:join)
  end

  def tune_guitar
    if @tuning == :standard
      standard_tuning
    elsif @tuning == :drop_d
      drop_d_duning
    end
  end

  private

  def standard_tuning
    @strings[0].tune(:e)
    @strings[1].tune(:a)
    @strings[2].tune(:d)
    @strings[3].tune(:g)
    @strings[4].tune(:b)
    @strings[5].tune(:e)
  end

  def drop_d_tuning
    @strings[0].tune(:d)
    @strings[1].tune(:a)
    @strings[2].tune(:d)
    @strings[3].tune(:g)
    @strings[4].tune(:b)
    @strings[5].tune(:e)
  end
end

class GuitarChord
  def initialize(note)
    @note = note
  end

  def first_fret
    if note == :c
      nil
    elsif note == :b_flat
      nil
    elsif note == :f
      nil
    elsif note == :d
      nil
    end
  end

  def second_fret
    if note == :c
      7
    elsif note == :b_flat
      8
    elsif note == :f
      15
    elsif note == :d
      5
    end
  end

  def third_fret
    if note == :c
      5
    elsif note == :b_flat
      8
    elsif note == :f
      15
    elsif note == :d
      4
    end
  end

  def fourth_fret
    if note == :c
      5
    elsif note == :b_flat
      7
    elsif note == :f
      14
    elsif note == :d
      2
    end
  end

  def fifth_fret
    if note == :c
      5
    elsif note == :b_flat
      6
    elsif note == :f
      13
    elsif note == :d
      3
    end
  end

  def sixth_fret
    if note == :c
      nil
    elsif note == :b_flat
      nil
    elsif note == :f
      nil
    elsif note == :d
      nil
    end
  end
end
