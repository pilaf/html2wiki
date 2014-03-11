# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html2wiki/version'

Gem::Specification.new do |spec|
  spec.name          = "html2wiki"
  spec.version       = HTML2Wiki::VERSION
  spec.authors       = ["Pilaf"]
  spec.email         = ["pfayolle@gmail.com"]
  spec.summary       = "Simple HTML to MediaWiki format converter."
  spec.homepage      = "https://github.com/pilaf/html2wiki"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 1.9.2")

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "nokogiri"

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
