# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_assets/version'

Gem::Specification.new do |spec|
  spec.name          = "js_assets"
  spec.version       = JsAssets::VERSION
  spec.authors       = ["Les Hill"]
  spec.email         = ["leshill@gmail.com"]
  spec.description   = %q{Precompile assets built with JavaScript compilers, for example mustache templates compiled by handlebars.js .}
  spec.summary   = %q{Precompile assets built with JavaScript compilers, for example mustache templates compiled by handlebars.js .}
  spec.homepage      = "https://github.com/leshill/js_assets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
