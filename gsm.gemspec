require 'pathname'

Gem::Specification.new do |s|
  
  # Variables
  s.author      = 'Ryan Scott Lewis'
  s.email       = 'ryan@rynet.us'
  s.summary     = "Easily update all of your git projects's submodules to their latest tags."
  s.license     = 'MIT'
  
  # Dependencies
  s.add_dependency 'version', '~> 1.0.0'
  s.add_dependency 'rugged',  '~> 0.17.0.b7'
  s.add_development_dependency 'guard-bundler', '~> 1.0.0'
  s.add_development_dependency 'guard-rspec',   '~> 2.5.0'
  s.add_development_dependency 'guard-yard',    '~> 2.1.0'
  s.add_development_dependency 'rake',          '~> 10.0.0'
  s.add_development_dependency 'fuubar',        '~> 1.1.0'
  s.add_development_dependency 'rb-fsevent',    '~> 0.9.0'
  s.add_development_dependency 'redcarpet',     '~> 2.2.0'
  s.add_development_dependency 'github-markup', '~> 0.7.0'
  s.add_development_dependency 'mocha',         '~> 0.13.0'
  # s.add_development_dependency 'fakefs',        '~> 0.4.0'
  
  # Pragmatically set variables
  s.homepage      = "http://github.com/RyanScottLewis/#{s.name}"
  s.version       = Pathname.glob('VERSION*').first.read rescue '0.0.0'
  s.description   = s.summary
  s.name          = Pathname.new(__FILE__).basename('.gemspec').to_s
  s.require_paths = ['lib']
  s.files         = Dir['{{Rake,Gem}file{.lock,},README*,VERSION,LICENSE,*.gemspec,lib/**/*']
  s.test_files    = Dir['{examples,spec,test}/**/*']
  
end
