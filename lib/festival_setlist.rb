require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/note"
require_relative "ruby_cover_band/setlist"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/songs/one_way_to_get_there"
require_relative "ruby_cover_band/instruments/synthesizer"
require_relative "ruby_cover_band/instruments/synthesizer/patch"
require_relative "ruby_cover_band/instruments/synthesizer/patch_memory"
require_relative "ruby_cover_band/instruments/synthesizer/sound_bank"
require_relative "ruby_cover_band/instruments/synthesizer/synth_sound"

beep = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :beep)
boop = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :boop)
buzz = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :buzz)
whirr = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :whirr)

synth = RubyCoverBand::Instruments::Synthesizer.new
synth.save_patch(location: :a1, patch: beep)
synth.save_patch(location: :a2, patch: boop)
synth.save_patch(location: :b1, patch: buzz)
synth.save_patch(location: :b2, patch: whirr)

band = RubyCoverBand::Band.new(name: "Nine Inch Nails")
band.keyboardist = synth

setlist = RubyCoverBand::Setlist.new(band)
setlist.add_song(RubyCoverBand::Songs::OneWayToGetThere.new)

concert = RubyCoverBand::Concert.new(setlist: setlist)

concert.set_up
concert.perform
concert.load_out
