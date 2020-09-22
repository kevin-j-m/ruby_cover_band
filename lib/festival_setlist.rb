require_relative "ruby_cover_band/band"
require_relative "ruby_cover_band/band/keyboardist"
require_relative "ruby_cover_band/concert"
require_relative "ruby_cover_band/note"
require_relative "ruby_cover_band/setlist"
require_relative "ruby_cover_band/song"
require_relative "ruby_cover_band/songs/one_way_to_get_there"
require_relative "ruby_cover_band/instruments/synthesizer"
require_relative "ruby_cover_band/instruments/synthesizer/patch"
require_relative "ruby_cover_band/instruments/synthesizer/moog_patch_memory"
require_relative "ruby_cover_band/instruments/synthesizer/nord_patch_memory"
require_relative "ruby_cover_band/instruments/synthesizer/sound_bank"
require_relative "ruby_cover_band/instruments/synthesizer/synth_sound"

beep = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :beep)
boop = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :boop)
buzz = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :buzz)
unused_buzz = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :buzz, effect: :chorus)
whirr = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :whirr)

moog = RubyCoverBand::Instruments::Synthesizer.new(brand: :moog)
moog.save_patch(location: :a1, patch: beep)
moog.save_patch(location: :a2, patch: boop)
moog.save_patch(location: :b1, patch: unused_buzz)
moog.save_patch(location: :b2, patch: whirr)

nord = RubyCoverBand::Instruments::Synthesizer.new(brand: :nord)
nord.save_patch(location: :a1, patch: buzz)

keyboardist = RubyCoverBand::Band::Keyboardist.new
keyboardist.add(moog)
keyboardist.add(nord)

band = RubyCoverBand::Band.new(name: "Nine Inch Nails")
band.keyboardist = keyboardist

setlist = RubyCoverBand::Setlist.new(band)
setlist.add_song(RubyCoverBand::Songs::OneWayToGetThere.new)

concert = RubyCoverBand::Concert.new(setlist: setlist)

concert.set_up
concert.perform
concert.load_out
