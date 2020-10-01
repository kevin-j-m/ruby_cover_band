# ruby lib/festival_patches_oneshot.rb

require "coverage"

Coverage.start(oneshot_lines: true)
load "lib/festival_setlist.rb"
result = Coverage.result

# p result

moog_oneshot = result
  .select { |k, v| k.end_with?("synthesizer/moog_patch_memory.rb") }
  .values
  .first[:oneshot_lines]

p moog_oneshot

puts "Moog Keyboard"
puts "============="
puts "Memory Location A1 #{"not " if !moog_oneshot.include?(18)}used"
puts "Memory Location A2 #{"not " if !moog_oneshot.include?(20)}used"
puts "Memory Location B1 #{"not " if !moog_oneshot.include?(22)}used"
puts "Memory Location B2 #{"not " if !moog_oneshot.include?(24)}used"

nord_oneshot = result
  .select { |k, v| k.end_with?("synthesizer/nord_patch_memory.rb") }
  .values
  .first[:oneshot_lines]

# p nord_oneshot

puts
puts "Nord Keyboard"
puts "============="
puts "Memory Location A1 #{"not " if !nord_oneshot.include?(42)}used"
puts "Memory Location A2 #{"not " if !nord_oneshot.include?(44)}used"
puts "Memory Location B1 #{"not " if !nord_oneshot.include?(46)}used"
puts "Memory Location B2 #{"not " if !nord_oneshot.include?(48)}used"
