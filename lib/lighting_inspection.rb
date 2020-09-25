require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/lighting_controller"
require_relative "ruby_cover_band/lighting/beam_projector"
require_relative "ruby_cover_band/lighting/can"
require_relative "ruby_cover_band/lighting/lighting_composition"
require_relative "ruby_cover_band/lighting/moving_light"
require_relative "ruby_cover_band/lighting/spotlight"
require_relative "ruby_cover_band/note"
require_relative "ruby_cover_band/setlist"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/songs/various_methods_of_escape"


band = RubyCoverBand::Band.new(name: "Nine Inch Nails")
setlist = RubyCoverBand::Setlist.new(band)
controller = RubyCoverBand::LightingController.new

setlist.lighting = controller
setlist.add_song(RubyCoverBand::Songs::VariousMethodsOfEscape.new)

concert = RubyCoverBand::Concert.new("RubyConf 2020")
concert.setlist = setlist

concert.set_up
concert.perform
concert.load_out
