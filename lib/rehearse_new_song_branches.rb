# ruby lib/rehearse_new_song_branches.rb

require "coverage"

Coverage.start(:all)
load("lib/rehearsal.rb")
result = Coverage.result

# p result

song_coverage = result.select { |k, v| k.end_with?("songs/branches_bones.rb") }
p song_coverage

branch_coverage_of_song = song_coverage.values.first[:branches]

p branch_coverage_of_song
