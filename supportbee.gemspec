# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'supportbee/version'

Gem::Specification.new do |spec|
  spec.name          = "supportbee"
  spec.version       = SupportBee::VERSION
  spec.authors       = ["Stefan Åhman"]
  spec.email         = ["stefan.ahman@apoex.se"]

  spec.summary       = %q{A gem for SupportBee's API}
  spec.homepage      = 'https://github.com/apoex/supportbee'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '>= 0.14.0'

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "dotenv"
end
