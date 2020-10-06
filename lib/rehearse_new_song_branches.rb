# ruby lib/rehearse_new_song_branches.rb

require "coverage"

Coverage.start(:all)
load("lib/rehearsal.rb")
result = Coverage.result

p result

song_coverage = result.select { |k, v| k.end_with?("songs/branches_bones.rb") }.values.first
p song_coverage
p "============"

p song_coverage.keys
p "============"

p song_coverage[:lines]
p song_coverage[:lines].include?(0)
p "============"

p song_coverage[:methods]
p song_coverage[:methods].values.include?(0)
p "============"

branch_coverage_of_song = song_coverage[:branches]

p branch_coverage_of_song

# {"lib/rehearsal.rb"=>{:lines=>[1, 1, 1, 1, 1, 1, 1, nil, 1, 1, nil, 1, 1, nil, 1], :branches=>{}, :methods=>{}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/band.rb"=>{:lines=>[1, 1, 1, 1, nil, 1, 1, nil, nil, nil], :branches=>{}, :methods=>{[RubyCoverBand::Band, :initialize, 6, 4, 8, 7]=>1}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/concert.rb"=>{:lines=>[1, 1, 1, 0, nil, nil, 1, 0, nil, nil, 1, 0, 0, 0, nil, nil, 1, nil, nil, 1, 0, nil, nil, 1, nil, 1, 0, nil, nil, 1, 0, nil, nil, nil], :branches=>{[:"&.", 0, 12, 6, 12, 36]=>{[:then, 1, 12, 6, 12, 36]=>0, [:else, 2, 12, 6, 12, 36]=>0}, [:"&.", 3, 13, 6, 13, 26]=>{[:then, 4, 13, 6, 13, 26]=>0, [:else, 5, 13, 6, 13, 26]=>0}, [:"&.", 6, 14, 6, 14, 30]=>{[:then, 7, 14, 6, 14, 30]=>0, [:else, 8, 14, 6, 14, 30]=>0}}, :methods=>{[RubyCoverBand::Concert, :lighting, 30, 4, 32, 7]=>0, [RubyCoverBand::Concert, :band, 26, 4, 28, 7]=>0, [RubyCoverBand::Concert, :perform, 20, 4, 22, 7]=>0, [RubyCoverBand::Concert, :load_out, 17, 4, 18, 7]=>0, [RubyCoverBand::Concert, :set_up, 11, 4, 15, 7]=>0, [RubyCoverBand::Concert, :setlist=, 7, 4, 9, 7]=>0, [RubyCoverBand::Concert, :initialize, 3, 4, 5, 7]=>0}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/note.rb"=>{:lines=>[1, 1, 1, 1, 1, 1, 1, 1, nil, 1, 11, 11, 11, 11, 11, 11, nil, nil, nil], :branches=>{}, :methods=>{[RubyCoverBand::Note, :initialize, 10, 4, 17, 7]=>11}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/song.rb"=>{:lines=>[1, 1, 1, nil, 1, 1, 1, nil, nil, 1, 1, 1, 1, 1, nil, nil, 1, 0, nil, nil, 1, 1, 11, nil, 22, 22, 22, 22, 22, nil, 11, 11, nil, nil, nil, nil], :branches=>{[:"&.", 0, 25, 36, 25, 55]=>{[:then, 1, 25, 36, 25, 55]=>0, [:else, 2, 25, 36, 25, 55]=>11}, [:"&.", 3, 26, 36, 26, 54]=>{[:then, 4, 26, 36, 26, 54]=>11, [:else, 5, 26, 36, 26, 54]=>0}, [:"&.", 6, 27, 36, 27, 52]=>{[:then, 7, 27, 36, 27, 52]=>0, [:else, 8, 27, 36, 27, 52]=>11}, [:"&.", 9, 28, 36, 28, 63]=>{[:then, 10, 28, 36, 28, 63]=>0, [:else, 11, 28, 36, 28, 63]=>11}, [:"&.", 12, 29, 36, 29, 60]=>{[:then, 13, 29, 36, 29, 60]=>0, [:else, 14, 29, 36, 29, 60]=>11}}, :methods=>{[RubyCoverBand::Song, :play, 21, 4, 34, 7]=>1, [RubyCoverBand::Song, :lighting=, 17, 4, 19, 7]=>0, [RubyCoverBand::Song, :performers=, 10, 4, 15, 7]=>1, [RubyCoverBand::Song, :initialize, 5, 4, 8, 7]=>1}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/songs/branches_bones.rb"=>{:lines=>[1, 1, 1, 1, 1, nil, nil, nil, nil, nil, 1, nil, 1, nil, 1, nil, nil, nil, 1, nil, 1, nil, nil, nil, 1, nil, 1, nil, nil, nil, nil, nil, 1, 2, nil, nil, 2, nil, nil, nil, nil, 2, nil, 2, 8, nil, nil, nil, nil, nil], :branches=>{[:if, 0, 34, 25, 34, 67]=>{[:then, 1, 34, 60, 34, 62]=>0, [:else, 2, 34, 65, 34, 67]=>2}, [:if, 3, 42, 18, 42, 99]=>{[:then, 4, 42, 41, 42, 75]=>0, [:else, 5, 42, 78, 42, 99]=>2}}, :methods=>{[RubyCoverBand::Songs::BranchesBones, :chorus, 33, 6, 47, 9]=>2, [RubyCoverBand::Songs::BranchesBones, :outro, 25, 6, 29, 9]=>1, [RubyCoverBand::Songs::BranchesBones, :verse_2, 19, 6, 23, 9]=>1, [RubyCoverBand::Songs::BranchesBones, :verse_1, 13, 6, 17, 9]=>1, [RubyCoverBand::Songs::BranchesBones, :initialize, 4, 6, 9, 9]=>1}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/instruments/vocal.rb"=>{:lines=>[1, 1, 1, 1, nil, 1, 1, nil, nil, 1, 11, 8, nil, 3, nil, nil, 11, nil, nil, 1, 8, 8, nil, nil, 1, 4, 4, nil, nil, nil, nil], :branches=>{[:if, 0, 11, 8, 15, 11]=>{[:then, 1, 12, 10, 12, 71]=>8, [:else, 2, 14, 10, 14, 23]=>3}}, :methods=>{[RubyCoverBand::Instruments::Vocal, :remove_effect, 25, 6, 28, 9]=>4, [RubyCoverBand::Instruments::Vocal, :set_effect, 20, 6, 23, 9]=>8, [RubyCoverBand::Instruments::Vocal, :sing, 10, 6, 18, 9]=>11, [RubyCoverBand::Instruments::Vocal, :initialize, 6, 6, 8, 9]=>1}}, "/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/instruments/vocal/lyric.rb"=>{:lines=>[1, 1, 1, 1, 1, 1, 1, nil, 1, 11, 11, 11, nil, nil, nil, nil, nil], :branches=>{}, :methods=>{[RubyCoverBand::Instruments::Vocal::Lyric, :initialize, 9, 8, 13, 11]=>11}}}
