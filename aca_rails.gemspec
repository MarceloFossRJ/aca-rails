$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aca_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aca_rails"
  s.version     = AcaRails::VERSION
  s.authors     = ["marcelofossrj"]
  s.email       = ["marcelo.foss.rj@gmail.com"]
  s.homepage    = "http://github/marcelofossrj"
  s.summary     = "AcaRails: Access Control Application gem for RoR."
  s.description = "A role based authentication and authorization gem for RoR"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.4"

  s.add_development_dependency "sqlite3"

  s.add_dependency "rspec-rails", "~> 3.6.0"
  s.add_dependency "capybara", "~> 2.14.4"
  s.add_dependency "factory_girl_rails", "~> 4.8.0"
  s.add_dependency "shoulda", "~> 3.5.0"
  s.add_dependency "database_cleaner", "~> 1.6.1"
  s.add_dependency "cucumber-rails", "~> 1.5.0"
end
