# ruby lib/rehearse_new_song_branches.rb

require "coverage"

Coverage.start(:all)
load("lib/rehearsal.rb")
result = Coverage.result

# p result

song_coverage = result.select { |k, v| k.end_with?("songs/branches_bones.rb") }
p song_coverage
p "============"

p song_coverage.values.first.keys
p "============"

p song_coverage.values.first[:lines]
p song_coverage.values.first[:lines].include?(0)
p "============"

p song_coverage.values.first[:methods]
p song_coverage.values.first[:methods].values.include?(0)
p "============"

branch_coverage_of_song = song_coverage.values.first[:branches]

p branch_coverage_of_song
