# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mercator/version'

Gem::Specification.new do |spec|
  spec.name          = "mercator"
  spec.version       = Mercator::VERSION
  spec.authors       = ["Martin Bergek"]
  spec.email         = ["contact@spotwise.com"]
  spec.summary       = %q{Tools to manage spherical to grid conversions}
  spec.description   = %q{This library provides classes and methods to perform conversions between spherical and grid coordinates.}
  spec.homepage      = "https://github.com/mbergek/mercator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 4.7', '>= 4.7.3'
  spec.add_runtime_dependency 'tilt', '~> 1.4', '>= 1.4.1'
  spec.add_runtime_dependency 'redcarpet', '~> 3.3', '>= 3.3.2'
end
