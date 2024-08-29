# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sa_vat_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "sa_vat_validation"
  spec.version       = SaVatValidation::VERSION
  spec.authors       = ["Gary Greyling"]
  spec.email         = ["greyling.gary@gmail.com"]
  spec.description   = "SA VAT number validation"
  spec.summary       = "SA VAT number validation"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.add_development_dependency "activesupport", "~> 4.2"
  spec.add_development_dependency "bundler", "~> 2.5.18"
  spec.add_development_dependency "pry",     "~> 0.14.2"
  spec.add_development_dependency "rake",    "~> 13.2.1"
  spec.add_development_dependency "rspec",   "~> 3.13.0"
end
