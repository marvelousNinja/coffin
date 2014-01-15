$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auth_lib/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auth_lib"
  s.version     = AuthLib::VERSION
  s.authors     = ["Alexander Sologub"]
  s.email       = ["alexsologoub@gmail.com"]
  s.homepage    = "http://there_is_no_homepage.com"
  s.summary     = "AuthLib is a plugin for centralized authorization and authorization in our systems"
  s.description = "AuthLib is a plugin for centralized authorization and authorization in our systems"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency 'devise'
  s.add_dependency 'devise-russian'
  s.add_dependency 'cancan'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-oauth2'

  s.add_development_dependency "sqlite3"
end
