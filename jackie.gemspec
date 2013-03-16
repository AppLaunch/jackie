# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jackie'

Gem::Specification.new do |spec|
  spec.name          = "jackie"
  spec.version       = Jackie::VERSION
  spec.authors       = ["Guillermo Iguaran", "Roberto Miranda", "Firebase.co"]
  spec.email         = ["guille@firebase.co", "roberto@firebase.co"]
  spec.description   = %q{A Ruby interface to the Kickfolio API.}
  spec.summary       = %q{A Ruby interface to the Kickfolio API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'

  spec.add_dependency 'activeresource'
end
