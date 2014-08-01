# -*- encoding: utf-8 -*-

require File.expand_path('../lib/orc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "orc"
  gem.version     = Orc::VERSION.dup
  gem.authors     = [ "Martin Gamsjaeger (snusnu)" ]
  gem.email       = [ "gamsnjaga@gmail.com" ]
  gem.description = "Operation result class"
  gem.summary     = "Provides Result.success(object) and Result.failure(status, context)"
  gem.homepage    = "https://github.com/snusnu/orc"

  gem.require_paths    = [ "lib" ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md TODO.md]
  gem.license          = 'MIT'

  gem.add_dependency 'concord',             '~> 0.1', '>= 0.1.5'
  gem.add_dependency 'abstract_type',       '~> 0.0', '>= 0.0.7'

  gem.add_development_dependency 'bundler', '~> 1.6', '>= 1.6.5'
  gem.add_development_dependency 'rspec',   '~> 3.0', '>= 3.0.0'
end
