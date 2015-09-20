# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strgen/version'

Gem::Specification.new do |spec|
  spec.name          = "strgen"
  spec.version       = Strgen::VERSION
  spec.authors       = ["Connor Atherton"]
  spec.email         = ["c.liam.atherton@gmail.com"]

  spec.summary       = %q{Ruby arbitrary string generator}
  spec.description   = %q{Ruby arbitrary string generator}
  spec.homepage      = "https://github.com/ConnorAtherton/strgen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "pry"
end
