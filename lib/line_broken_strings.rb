# ruby lib/line_coverage_results.rb

require "coverage"

Coverage.start(lines: true)
load "lib/concert_simulation.rb"
result = Coverage.result

# p result

string_results = result.select { |k, v| k.end_with?("guitar/string.rb") }
string_lines = string_results.values.first[:lines]

puts "Number of broken strings: #{string_lines[54]}"
