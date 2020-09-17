# ruby lib/line_coverage_results.rb

require "coverage"

Coverage.start(lines: true)
load "lib/line_coverage.rb"
result = Coverage.result

# p result

string_results = result.select { |k, v| k.end_with?("guitar/string.rb") }
# puts string_results
# puts string_results.first

original_string_lines = result.dig("/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/instruments/guitar/string.rb", :lines)
string_lines = string_results.values.first[:lines]#result.dig("/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/instruments/guitar/string.rb", :lines)
# puts string_lines

puts "Number of broken strings: #{string_lines[51]}"
puts "Number of broken strings: #{original_string_lines[51]}"
