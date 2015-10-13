# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clumsy/version'

Gem::Specification.new do |spec|
  spec.name          = "clumsy"
  spec.version       = Clumsy::VERSION
  spec.authors       = ["Darby Frey"]
  spec.email         = ["darbyfrey@gmail.com"]

  spec.summary       = %q{A clumsy tool for end-to-end proxy testing}
  spec.description   = %q{A clumsy tool for end-to-end proxy testing}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack'
  spec.add_dependency 'http'
  spec.add_dependency 'hashie'
  spec.add_dependency 'pry'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
