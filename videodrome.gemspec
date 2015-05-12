# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'videodrome/version'

Gem::Specification.new do |spec|
  spec.name          = "videodrome"
  spec.version       = Videodrome::VERSION
  spec.authors       = ["Aitor García"]
  spec.email         = ["aitor@linkingpaths.com"]
  spec.summary       = %q{Access metadata of public videos on Youtube.}
  spec.homepage      = "http://github.com/linkingpaths/videodrome"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
