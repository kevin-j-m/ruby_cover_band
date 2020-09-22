# ruby lib/line_festival_patches.rb

require "coverage"

Coverage.start(lines: true)
load "lib/festival_setlist.rb"
result = Coverage.result

# p result

moog_lines = result
  .select { |k, v| k.end_with?("synthesizer/moog_patch_memory.rb") }
  .values
  .first[:lines]

# p moog_lines

puts "Moog Keyboard"
puts "============="
puts "Patch A1 used #{moog_lines[35]} times"
puts "Patch A2 used #{moog_lines[37]} times"
puts "Patch B1 used #{moog_lines[39]} times"
puts "Patch B2 used #{moog_lines[41]} times"

nord_lines = result
  .select { |k, v| k.end_with?("synthesizer/nord_patch_memory.rb") }
  .values
  .first[:lines]

# p nord_lines

puts
puts "Nord Keyboard"
puts "============="
puts "Patch A1 used #{nord_lines[17]} times"
puts "Patch A2 used #{nord_lines[19]} times"
puts "Patch B1 used #{nord_lines[21]} times"
puts "Patch B2 used #{nord_lines[23]} times"
