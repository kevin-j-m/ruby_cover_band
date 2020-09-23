# ruby lib/rehearse_new_song_line.rb

require "coverage"

Coverage.start(lines: true)
load("lib/rehearsal.rb")
result = Coverage.result

# p result

song = result.select { |k, v| k.end_with?("songs/branches_bones.rb") }.values.first[:lines]

p song
