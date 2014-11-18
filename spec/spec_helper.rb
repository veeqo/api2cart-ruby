require_relative File.join(__dir__, '../lib/api2cart')

require 'rspec/core'
require 'webmock'
require 'vcr'

Dir[File.join(__dir__, "support/**/*.rb")].each { |f| require f }
Dir[File.join(__dir__, "shared_examples/**/*.rb")].sort.each { |f| require f }

VCR.configure do |c|
  c.cassette_library_dir = File.join(__dir__, "vcr_cassettes")
  c.configure_rspec_metadata!
  c.hook_into :webmock
end
