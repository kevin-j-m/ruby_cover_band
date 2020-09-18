module RubyCoverBand
  RSpec.describe Song do
    describe "#performers=" do
      it "decomposes all the members of the band as performers of the song" do
        song = Song.new(beats: [], name: "Somewhat Damaged")

        guitarist = Instruments::Guitar.new(amplifier: PracticeAmplifier.new)
        singer = Instruments::Vocal.new
        drummer = Instruments::Drum.new
        keyboardist = Instruments::Synthesizer.new

        band = Band.new
        band.guitarist = guitarist
        band.singer = singer
        band.drummer = drummer
        band.keyboardist = keyboardist

        expect { song.performers = band }
          .to change { song.instance_variable_get(:@guitar) }
          .from(nil).to(guitarist)
          .and change { song.instance_variable_get(:@vocal) }
          .from(nil).to(singer)
          .and change { song.instance_variable_get(:@drum) }
          .from(nil).to(drummer)
          .and change { song.instance_variable_get(:@synth) }
          .from(nil).to(keyboardist)
      end
    end

    describe "#play" do
      it "plays all the beats of the songs" do
          allow(Instruments::Guitar::StringPerformance).to receive(:exhausted?).and_return(false)

        first_beat = Beat.new(guitar_chord: Instruments::Guitar::Chords::CHalfBar.new)
        second_beat = Beat.new(guitar_chord: Instruments::Guitar::Chords::FHalfBar.new)

        song = Song.new(beats: [first_beat, second_beat], name: "Copy of A")

        guitarist = Instruments::Guitar.new(amplifier: PracticeAmplifier.new)
        band = Band.new
        band.guitarist = guitarist
        song.performers = band

        expect(song.play).to eq [
          [[nil, :e, :g, :c, :e, nil], nil, nil, nil],
          [[nil, :c, :f, :a, :c, nil], nil, nil, nil],
        ]
      end
    end
  end
end