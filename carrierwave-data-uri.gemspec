# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave_data_uri/version'

Gem::Specification.new do |spec|
  spec.name          = 'carrierwave-data-uri'
  spec.version       = Carrierwave::Data::Uri::VERSION
  spec.authors       = ['Tima Maslyuchenko']
  spec.email         = ['insside@gmail.com']
  spec.summary       = %q{Carrierwave plugin that allows create image from data uri}
  spec.description   = %q{Carrierwave plugin that allows create image from data uri}
  spec.homepage      = 'https://github.com/timsly/carrierwave-data-uri'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'carrierwave'
  spec.add_dependency 'data_uri'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'sqlite3'
end
