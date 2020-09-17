module RubyCoverBand
  RSpec.describe Concert do
    describe "#set_up" do
      it "restrings and tunes the guitarist's guitar" do
        band = Band.new(name: "Nine Inch Nails")
        guitarist = Instruments::Guitar.new
        band.guitarist = guitarist

        allow(guitarist).to receive(:change_strings)
        allow(guitarist).to receive(:tune)

        setlist = Setlist.new(band)
        concert = Concert.new(setlist: setlist)

        concert.set_up

        expect(guitarist).to have_received(:change_strings)
        expect(guitarist).to have_received(:tune)
      end
    end

    describe "#perform" do
      it "plays each of the songs in the setlist" do
        band = Band.new(name: "Nine Inch Nails")

        line = Song.new(name: "The Line Begins To Blur")
        method = Song.new(name: "Various Methods Of Escape")

        allow(line).to receive(:play)
        allow(method).to receive(:play)

        setlist = Setlist.new(band)
        setlist.add_song(line)
        setlist.add_song(method)

        concert = Concert.new(setlist: setlist)

        concert.perform

        expect(line).to have_received(:play)
        expect(method).to have_received(:play)
      end
    end
  end
end
