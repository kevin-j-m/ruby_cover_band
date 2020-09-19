# TODO: clean these requires up so they're consistent
require_relative "ruby_cover_band/amplifier"
require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/instruments/drum"
require_relative "ruby_cover_band/instruments/guitar"
require_relative "ruby_cover_band/instruments/guitar/chords/b_flat_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/c_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/d_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/f_half_bar"
require_relative "ruby_cover_band/instruments/guitar/chords/power_chord"
require_relative "ruby_cover_band/instruments/guitar/fret"
require_relative "ruby_cover_band/instruments/guitar/string"
require_relative "ruby_cover_band/instruments/synthesizer"
require_relative "ruby_cover_band/instruments/vocal"
require_relative "ruby_cover_band/note"
require_relative "ruby_cover_band/setlist"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/songs/the_line_begins_to_blur"
require_relative "ruby_cover_band/version"

def build_band(name: "Nine Inch Nails")
  band = RubyCoverBand::Band.new(name: name)
  band.guitarist = RubyCoverBand::Instruments::Guitar.new(tuning: :drop_d, amplifier: RubyCoverBand::Amplifier.new)

  band
end

band = build_band(name: "Nine Inch Nails")

setlist = RubyCoverBand::Setlist.new(band)
setlist.add_song(RubyCoverBand::Songs::TheLineBeginsToBlur.new)

concert = RubyCoverBand::Concert.new(setlist: setlist)

10.times do
  concert.set_up
  concert.perform
  concert.load_out
end
