# Enough Coverage To Beat The Band

## Abstract

The lights cut out. The crowd roars. It’s time. The band takes the stage. They’ve practiced the songs, particularly the covers. They’ve sound checked the coverage of the speakers. They know the lighting rig has the proper colored gels covering the lamps. They’re nervous, but they’ve got it all covered.

Similarly, code coverage can give you confidence before your app performs on production and also tell you how live code is used (or not used). We’ll cover how to leverage ruby’s different coverage measurement techniques in concert to assist your crew and delight your audience.

## Presentation Details

This [talk](https://kevin-j-m.github.io/coverage/) is an explanation of the different modes ruby’s [Coverage](https://ruby-doc.org/stdlib-2.7.1/libdoc/coverage/rdoc/Coverage.html) module provides. It uses the theme of staging a concert as the through line.

For each mode, we examine how it works and what it tells you. We examine the coverage results of code that models performing a concert as example scenarios where that code coverage mode yields actionable insights. While code coverage is frequently talked about in regards to an application’s test suite, this talk explores how coverage can be used for instrumenting a running application in production.

Each coverage mode answers a different question about the code that was run under coverage:

* Lines - how many times was each line executed?
* Oneshot Lines - which lines were executed?
* Methods - how many times was each method executed?
* Branches - how many times was each conditional executed?

## Slides

The latest iteration of the slides that accompany this presentation are available [here](beat_the_band.key) in this repository. The slide deck in this repo is in macOS's Keynote format. A copy of the slides are also available on [SpeakerDeck](https://speakerdeck.com/kevinmurphy/enough-coverage-to-beat-the-band).

## Code Examples

### Lines Coverage

* Guitar String [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/instruments/guitar/string.rb#L20-L29)
* Play First Ten [Shows](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/tour_leg_1.rb)
* Running Lines Coverage [Script](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/broken_strings_line.rb)

In order for the ten shows or the coverages script to run, [Sonic Pi](https://sonic-pi.net/) must be
installed and be running. The [sonic-pi-cli](https://github.com/Widdershin/sonic-pi-cli) gem is used to communicate with Sonic Pi.

This script will take a long time to run, as it actually plays the (one song)
setlist for the tour ten times, with opportunities for strings to break.

### Oneshot Lines Coverage

* Synth Patch Memory [Implementation](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/instruments/synthesizer/moog_patch_memory.rb#L15-L26)
* Festival [Setlist](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/festival_setlist.rb)
* Running Oneshot Lines Coverage [Script](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/festival_patches_oneshot.rb)

### Methods Coverage

* Lighting Controller [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/lighting_controller.rb#L14-L21)
* Beam Projector [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/lighting/beam_projector.rb#L4-L6)
* Can Light [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/lighting/can.rb#L4-L6)
* Moving Light [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/lighting/moving_light.rb#L4-L6)
* Spotlight [Class](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/lighting/spotlight.rb#L4-L6)
* Observing Lighting [Used](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/lighting_inspection.rb)
* Running Methods Coverage [Script](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/lighting_inspection_method.rb)

### Branches Coverage

* Soundcheck [Song](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/ruby_cover_band/songs/branches_bones.rb#L33-L46)
* Song [Rehearsal](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/rehearsal.rb)
* Running All Coverage [Script](https://github.com/kevin-j-m/ruby_cover_band/blob/9b440d02738437728305e5ebccdfc0781f4b7b7a/lib/rehearse_new_song_branches.rb), including Branches

## Seen At

* [RubyConf](http://rubyconf.org/program/sessions#session-1044) - November 17, 2020
