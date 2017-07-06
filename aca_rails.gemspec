$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aca_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aca_rails"
  s.version     = AcaRails::VERSION
  s.authors     = ["marcelofossrj"]
  s.email       = ["marcelo.foss.rj@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AcaRails."
  s.description = "TODO: Description of AcaRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.4"

  s.add_development_dependency "sqlite3"
end
