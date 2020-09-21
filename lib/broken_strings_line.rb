# ruby lib/line_broken_strings.rb

require "coverage"

Coverage.start(lines: true)
load "lib/tour_leg_1.rb"
result = Coverage.result

# p result

string_results = result.select { |k, v| k.end_with?("guitar/string.rb") }
string_lines = string_results.values.first[:lines]

puts "Number of broken strings: #{string_lines[54]}"
