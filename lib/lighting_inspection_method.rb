require "coverage"

Coverage.start(methods: true)
load "lib/lighting_inspection.rb"
result = Coverage.result

p result

p "============"

light_results = result.select { |k, _v| k.include?("/lighting/") }

never_triggered_lights = light_results
  .values
  .flat_map { |light| light.values }
  .select { |light| light.values.first == 0 }
  .map { |never_triggered| never_triggered.keys.first.first }

p never_triggered_lights
