$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'obviews/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'obviews'
  s.version     = Obviews::VERSION
  s.authors     = ['Elia Schito']
  s.email       = ['elia@schito.me']
  s.homepage    = 'http://elia.schito.me'
  s.summary     = 'Secret business.'
  s.description = 'Secret business.'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rails', '~> 3.2.3'
  s.add_development_dependency 'rspec-rails', '~> 2.10'
end
