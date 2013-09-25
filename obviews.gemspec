$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'obviews/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'obviews'
  s.version     = Obviews::VERSION
  s.authors     = ['Elia Schito']
  s.email       = ['elia@schito.me']
  s.homepage    = 'https://elia.github.com/obviews'
  s.summary     = 'Restores the obvious OOP method interface between Rails controllers and views'
  s.description = 'Restores the obvious OOP method interface between Rails controllers and views'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rails', '~> 4.0'
  s.add_runtime_dependency 'activeresource', '~> 4.0'
  s.add_development_dependency 'rspec-rails', '~> 2.10'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'spectator'
end
