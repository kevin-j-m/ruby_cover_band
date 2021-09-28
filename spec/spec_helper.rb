require "bundler/setup"
require "pry"
require "ruby_cover_band"
require "mocktail" # TODO: need to require it?

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Mocktail::DSL

  config.after(:each) do
    Mocktail.reset
  end
end
