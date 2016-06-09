$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'inner_messenger/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'inner_messenger'
  s.version     = InnerMessenger::VERSION
  s.authors     = ['mmmpa']
  s.email       = ['mmmpa.mmmpa@gmail.com']
  s.homepage    = 'http://mmmpa.net'
  s.summary     = 'Summary of InnerMessenger.'
  s.description = 'Description of InnerMessenger.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'rails', '~> 5.0.0.rc1'
  s.add_dependency 'slim-rails'
  s.add_dependency 'sass'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-html-matchers'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'coveralls'
end
