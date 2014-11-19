# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api2cart/version'

Gem::Specification.new do |spec|
  spec.name          = "api2cart-ruby"
  spec.version       = Api2cart::VERSION

  spec.authors       = ["Tom Procter", "Daniel Vartanov"].sort
  spec.email         = ["tom@procterweb.co.uk", "dan@vartanov.net"]

  spec.summary       = %q{Ruby client for API2Cart}
  spec.description   = %q{Ruby client for API2Cart with proxy support}
  spec.homepage      = "https://github.com/DanielVartanov/api2cart-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
