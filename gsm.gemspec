require 'pathname'

Gem::Specification.new do |s|
  
  # Variables
  s.author      = 'Ryan Scott Lewis'
  s.email       = 'ryan@rynet.us'
  s.summary     = "Easily update all of your git projects's submodules to their latest tags."
  s.license     = 'MIT'
  
  # Dependencies
  s.add_dependency 'version',          '~> 1.0'
  s.add_development_dependency 'rake',           '~> 10.0'
  s.add_development_dependency 'rspec',          '~> 2.13'
  s.add_development_dependency 'fuubar',         '~> 1.1'
  
  # Pragmatically set variables
  s.homepage      = "http://github.com/RyanScottLewis/#{s.name}"
  s.version       = Pathname.glob('VERSION*').first.read rescue '0.0.0'
  s.description   = s.summary
  s.name          = Pathname.new(__FILE__).basename('.gemspec').to_s
  s.require_paths = ['lib']
  s.files         = Dir['{{Rake,Gem}file{.lock,},README*,VERSION,LICENSE,*.gemspec,lib/**/*']
  s.test_files    = Dir['{examples,spec,test}/**/*']
  
end
