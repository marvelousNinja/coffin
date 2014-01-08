$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mq_connector/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mq_connector"
  s.version     = MqConnector::VERSION
  s.authors     = ["Alexander Sologub"]
  s.email       = ["alexsologoub@gmail.com"]
  s.homepage    = "http://there_is_no_homepage.com"
  s.summary     = "MqConnector is a daemon/adapter combination for working with RabbitMQ inside of a Rails app"
  s.description = "MqConnector is a daemon/adapter combination for working with RabbitMQ inside of a Rails app"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency 'daemons-rails'
  s.add_dependency 'bunny'

  s.add_development_dependency "sqlite3"
end
