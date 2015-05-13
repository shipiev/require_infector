# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'require_infector/version'

Gem::Specification.new do |spec|
  spec.name          = 'require_infector'
  spec.version       = RequireInfector::VERSION
  spec.authors       = ['Roman Shipiev']
  spec.email         = ['roman@shipiev.pro']
  spec.summary       = %q{The gem add 'require_infector' to ActionDispatch}
  spec.description   = %q{It's using for patching}
  spec.homepage      = 'https://github.com/shipiev/require_infector'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rails'
end
