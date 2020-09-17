# irb
# require "ruby_cover_band"
# RubyCoverBand::LineCoverage.new.run

require "coverage"

module RubyCoverBand
  class LineCoverage
    def run
      band = build_band(name: "Nine Inch Nails")
      song = build_song(name: "The Line Begins To Blur")

      setlist = Setlist.new(band)
      setlist.add_song(song)

      concert = Concert.new(setlist: setlist)

      # Coverage.start(lines: true)

      # 10.times do
        concert.perform
      # end

      # Coverage.result
    end

    private

    def build_band(name:)
      band = Band.new(name: name)
      band.guitarist = Instruments::Guitar.new(tuning: :drop_d)

      band
    end

    def build_song(name:)
      beats = []

      8.times do
        beats << Beat.new(guitar_chord: Instruments::Guitar::Chords::CHalfBar.new)
      end

      8.times do
        beats << Beat.new(guitar_chord: Instruments::Guitar::Chords::BFlatHalfBar.new)
      end

      8.times do
        beats << Beat.new(guitar_chord: Instruments::Guitar::Chords::FHalfBar.new)
      end

      8.times do
        beats << Beat.new(guitar_chord: Instruments::Guitar::Chords::DHalfBar.new)
      end

      Song.new(beats: beats, name: name)
    end
  end
end
