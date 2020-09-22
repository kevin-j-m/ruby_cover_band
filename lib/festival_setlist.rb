require_relative "ruby_cover_band/band"
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

beep = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :beep, effect: :flanger)
boop = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :boop, filter: :highpass, effect: :chorus)
buzz = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :buzz, oscillator: :triangle)
whirr = RubyCoverBand::Instruments::Synthesizer::Patch.new(sound: :whirr, oscillator: :sawtooth)

# TODO: have 2 synths so can consolidate results into one
# This may mean two different patch memory classes based on the type of synth.
# Have synth take an arg for the type/brand
# How does the note tell you which to play?
# Right now the patch location is passed in
# Maybe it should be something else and the patches need to be searched first?
# Probably should pass in the patch itself? Or need a == for a patch to compare
# them, because won't have the same object in memory.
synth = RubyCoverBand::Instruments::Synthesizer.new(brand: :moog)
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
