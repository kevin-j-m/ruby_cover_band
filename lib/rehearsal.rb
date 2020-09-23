require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/note"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/songs/branches_bones"
require_relative "ruby_cover_band/instruments/vocal"
require_relative "ruby_cover_band/instruments/vocal/lyric"

band = RubyCoverBand::Band.new(name: "Nine Inch Nails")
band.singer = RubyCoverBand::Instruments::Vocal.new

song = RubyCoverBand::Songs::BranchesBones.new
song.performers = band

song.play
