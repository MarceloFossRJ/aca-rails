source 'https://rubygems.org'

# Declare your gem's dependencies in aca_rails.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem "simple_form", "~> 3.5.0"
gem "paper_trail", "~> 7.0.3"
gem "ransack", "~> 1.8.3"
gem "kaminari", "~>1.0.1"
gem "bcrypt", "~>3.1.11"
gem "brakeman"
group :development, :test do
  gem "rspec-rails", "~> 3.6.0"
  gem "factory_girl_rails", "~> 4.8.0"
  gem "shoulda", "~> 3.5.0"
  gem "better_errors"
end
group :test do
  gem "database_cleaner", "~> 1.6.1"
  gem "capybara", "~> 2.14.4"
  gem "cucumber-rails", "~> 1.5.0", require: false
  gem "simplecov", "~> 0.14.1", require: false
end