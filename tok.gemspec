# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tok/version'

Gem::Specification.new do |spec|
  spec.name          = "tok"
  spec.version       = Tok::VERSION
  spec.authors       = ["Ahmed Hazem"]
  spec.email         = ["ahazemm@gmail.com"]
  spec.summary       = %q{No-frills token-based authentication for modern Rails applications.}
  spec.description   = %q{The token-based authentication library for the ambitious.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.0"
  spec.add_dependency "rails-api", "~> 0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 3.1"
  spec.add_development_dependency "factory_girl_rails", "~> 4.4"
  spec.add_development_dependency "pg", "~> 0.17"
end
