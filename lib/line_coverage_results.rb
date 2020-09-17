# ruby lib/line_coverage_results.rb

require "coverage"

Coverage.start(lines: true)
load "lib/line_coverage.rb"
result = Coverage.result

# p result

string_lines = result.dig("/Users/kevin/dev/kevin-j-m/ruby_cover_band/lib/ruby_cover_band/instruments/guitar/string.rb", :lines)

puts "Number of broken strings: #{string_lines[51]}"
