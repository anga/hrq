# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hrq/version'

Gem::Specification.new do |spec|
  spec.name          = "hrq"
  spec.version       = HRQ::VERSION
  spec.authors       = ["Andres B."]
  spec.email         = ["andres.b.dev@gmail.com"]
  spec.summary       = %q{Human readable query}
  spec.description   = %q{HRQ allows you to write human readable queries and translate them into real SQL}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rspec-mock", "~> 3.1"
end
