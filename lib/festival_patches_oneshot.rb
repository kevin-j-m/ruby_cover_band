# ruby lib/festival_patches_oneshot.rb

require "coverage"

Coverage.start(oneshot_lines: true)
load "lib/festival_setlist.rb"
result = Coverage.result

# p result

moog = result
  .select { |k, v| k.end_with?("synthesizer/moog_patch_memory.rb") }
  .values
  .first[:oneshot_lines]

# p moog

puts "Moog Keyboard"
puts "============="
puts "Memory Location A1 #{"not " if !moog.include?(18)}used"
puts "Memory Location A2 #{"not " if !moog.include?(20)}used"
puts "Memory Location B1 #{"not " if !moog.include?(22)}used"
puts "Memory Location B2 #{"not " if !moog.include?(24)}used"
puts
puts "Moog Keyboard"
puts "=============="
puts "Location A1: #{moog.include?(18) ? 'Y' : 'N'}"
puts "Location A2: #{moog.include?(20) ? 'Y' : 'N'}"
puts "Location B1: #{moog.include?(22) ? 'Y' : 'N'}"
puts "Location B2: #{moog.include?(24) ? 'Y' : 'N'}"

nord = result
  .select { |k, v| k.end_with?("synthesizer/nord_patch_memory.rb") }
  .values
  .first[:oneshot_lines]

# p nord_oneshot

puts
puts "Nord Keyboard"
puts "============="
puts "Memory Location A1 #{"not " if !nord.include?(42)}used"
puts "Memory Location A2 #{"not " if !nord.include?(44)}used"
puts "Memory Location B1 #{"not " if !nord.include?(46)}used"
puts "Memory Location B2 #{"not " if !nord.include?(48)}used"
puts
puts "Nord Keyboard"
puts "=============="
puts "Location A1: #{nord.include?(42) ? 'Y' : 'N'}"
puts "Location A2: #{nord.include?(44) ? 'Y' : 'N'}"
puts "Location B1: #{nord.include?(46) ? 'Y' : 'N'}"
puts "Location B2: #{nord.include?(48) ? 'Y' : 'N'}"
