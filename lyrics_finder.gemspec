# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyrics_finder/version'

Gem::Specification.new do |spec|
  spec.name          = 'lyrics_finder'
  spec.version       = LyricsFinder::VERSION
  spec.authors       = ['Daniel Romero']
  spec.email         = ['dromveg@gmail.com']
  spec.summary       = %q{Solution for finding song lyrics}
  spec.description   = %q{Simple library for finding song lyrics}
  spec.homepage      = 'https://github.com/dnlR/lyrics_finder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'vcr', '~> 4.0'
  spec.add_development_dependency 'webmock', '~> 3.2'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_dependency 'nokogiri', '~> 1.8'
  spec.add_dependency 'i18n', '~> 0.9'
  spec.add_dependency 'thor', '~> 0.19'
end
