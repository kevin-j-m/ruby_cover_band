# ruby lib/rehearse_new_song_branches.rb

require "coverage"

Coverage.start(branches: true)
load("lib/rehearsal.rb")
result = Coverage.result

# p result

song = result.select { |k, v| k.end_with?("songs/branches_bones.rb") }.values.first[:branches]

p song
