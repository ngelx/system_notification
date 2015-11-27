$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "system_notification/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "system_notification"
  s.version     = SystemNotification::VERSION
  s.authors     = ["Angel Arancibia"]
  s.email       = ["ngel@protonmail.com"]
  s.homepage    = "https://github.com/ngelx/system_notification"
  s.summary     = "System wide persistent notification."
  s.description = "System notification that will survive through different request. i.e. notify user for account limits."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "twitter-bootstrap-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl'

  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'simplecov'

end
