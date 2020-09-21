# ruby lib/oneshot_festival_patches.rb

require "coverage"

Coverage.start(oneshot_lines: true)
load "lib/festival_setlist.rb"
result = Coverage.result

# p result

oneshot = result
  .select { |k, v| k.end_with?("synthesizer/patch_memory.rb") }
  .values
  .first[:oneshot_lines]

# p oneshot

puts "Patch A1 #{"not " if !oneshot.include?(32)}used"
puts "Patch A2 #{"not " if !oneshot.include?(34)}used"
puts "Patch B1 #{"not " if !oneshot.include?(36)}used"
puts "Patch B2 #{"not " if !oneshot.include?(38)}used"
