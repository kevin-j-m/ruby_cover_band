module RubyCoverBand
  RSpec.describe Setlist do
    describe "#add_song" do
      it "adds the song to the setlist" do
        band = Band.new(name: "Nine Inch Nails")
        song = Song.new(name: "Terrible Lie")

        setlist = Setlist.new(band)

        expect { setlist.add_song(song) }
          .to change { setlist.songs.map(&:name) }
          .from([])
          .to(["Terrible Lie"])
      end

      it "sets the band as the performers of the song" do
        band = Band.new(name: "Nine Inch Nails")
        band.guitarist = Instruments::Guitar.new
        song = Song.new(name: "Terrible Lie")

        setlist = Setlist.new(band)

        expect { setlist.add_song(song) }
          .to change { song.instance_variable_get(:@guitar) }
          .from(nil)
          .to(band.guitarist)
      end
    end
  end
end
