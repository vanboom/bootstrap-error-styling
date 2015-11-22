# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap-error-styling/version'

Gem::Specification.new do |spec|
  spec.name          = "bootstrap-error-styling"
  spec.version       = BootstrapErrorStyling::VERSION
  spec.authors       = ["vanboom"]
  spec.email         = ["dvboom@hotmail.com"]
  spec.description   = %q{This gem adds error classes to form elements per Bootstrap 3.}
  spec.summary       = %q{Form error and alert styling for Bootstrap 3 Users}
  spec.homepage      = "http://github.com/vanboom/bootstrap-error-styling"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
end
