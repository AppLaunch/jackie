# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jackie"
  spec.version       = "0.1.1"
  spec.authors       = ["Lacides Charris", "Guillermo Iguaran", "Roberto Miranda", "Firebase.co"]
  spec.email         = ["lacides@firebase.co", "guille@firebase.co", "roberto@firebase.co", "hello@firebase.co"]
  spec.description   = %q{A Ruby interface to the Kickfolio API.}
  spec.summary       = %q{A Ruby interface to the Kickfolio API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "fakes3"

  spec.add_dependency "activeresource", ">= 3.0"
end
