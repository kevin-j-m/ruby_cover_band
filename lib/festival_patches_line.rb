# ruby lib/line_festival_patches.rb

require "coverage"

Coverage.start(lines: true)
load "lib/festival_setlist.rb"
result = Coverage.result

# p result

lines = result
  .select { |k, v| k.end_with?("synthesizer/patch_memory.rb") }
  .values
  .first[:lines]

# p lines

puts "Patch A1 used #{lines[31]} times"
puts "Patch A2 used #{lines[33]} times"
puts "Patch B1 used #{lines[35]} times"
puts "Patch B2 used #{lines[37]} times"
