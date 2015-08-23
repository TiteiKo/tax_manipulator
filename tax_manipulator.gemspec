# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tax_manipulator/version'

Gem::Specification.new do |spec|
  spec.name          = "tax_manipulator"
  spec.version       = TaxManipulator::VERSION
  spec.authors       = ["Marion Duprey"]
  spec.email         = ["titeiko@gmail.com"]

  spec.summary       = %q{Configurable vat, price including tax and price excluding tax computing}
  spec.homepage      = "https://github.com/TiteiKo/tax_manipulator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'

  spec.add_development_dependency 'bundler', '>= 1.7'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
end
