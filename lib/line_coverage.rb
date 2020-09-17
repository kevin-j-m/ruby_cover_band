require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/beat"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/instruments/drum"
require_relative "ruby_cover_band/instruments/guitar"
require_relative "ruby_cover_band/instruments/guitar/chords/b_flat_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/c_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/d_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/f_half_bar"
require_relative "ruby_cover_band/instruments/guitar/fret"
require_relative "ruby_cover_band/instruments/guitar/string"
require_relative "ruby_cover_band/instruments/synthesizer"
require_relative "ruby_cover_band/instruments/vocal"
require_relative "ruby_cover_band/setlist"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/version"

def build_band(name: "Nine Inch Nails")
  band = RubyCoverBand::Band.new(name: name)
  band.guitarist = RubyCoverBand::Instruments::Guitar.new(tuning: :drop_d)

  band
end

def build_song(name:)
  beats = []

  8.times do
    beats << RubyCoverBand::Beat.new(guitar_chord: RubyCoverBand::Instruments::Guitar::Chords::CHalfBar.new)
  end

  8.times do
    beats << RubyCoverBand::Beat.new(guitar_chord: RubyCoverBand::Instruments::Guitar::Chords::BFlatHalfBar.new)
  end

  8.times do
    beats << RubyCoverBand::Beat.new(guitar_chord: RubyCoverBand::Instruments::Guitar::Chords::FHalfBar.new)
  end

  8.times do
    beats << RubyCoverBand::Beat.new(guitar_chord: RubyCoverBand::Instruments::Guitar::Chords::DHalfBar.new)
  end

  RubyCoverBand::Song.new(beats: beats, name: name)
end

band = build_band(name: "Nine Inch Nails")
song = build_song(name: "The Line Begins To Blur")

setlist = RubyCoverBand::Setlist.new(band)
setlist.add_song(song)

concert = RubyCoverBand::Concert.new(setlist: setlist)

10.times do
  concert.set_up
  concert.perform
  concert.load_out
end
