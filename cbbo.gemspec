# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbbo'

Gem::Specification.new do |spec|
  spec.name          = "cbbo"
  spec.version       = Cbbo::VERSION
  spec.authors       = ["Mike Campbell"]
  spec.email         = ["mike@wordofmike.net"]

  spec.summary       = "Crude black box optimiser"
  spec.homepage      = "https://github.com/mikecmpbll/cbbo"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
