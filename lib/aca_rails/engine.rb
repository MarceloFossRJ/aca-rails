module AcaRails
  class << self
    mattr_accessor :app_name
    self.app_name = "App Name"

    mattr_accessor :records_per_page
    self.records_per_page = 5

    mattr_accessor :number_wrong_login_attempts
    self.number_wrong_login_attempts = 5

    mattr_accessor :expire_session_per_time
    self.expire_session_per_time = true

    mattr_accessor :minutes_to_expire_session
    self.minutes_to_expire_session = 180

    mattr_accessor :unlock_account_per_time
    self.unlock_account_per_time = true

    mattr_accessor :minutes_account_blocked
    self.minutes_account_blocked = 60

    mattr_accessor :user_can_signup
    self.user_can_signup = false
##
    mattr_accessor :user_can_inactivate_account
    self.user_can_inactivate_account = true

    mattr_accessor :user_can_delete_account
    self.user_can_delete_account = true

    mattr_accessor :user_can_be_deleted
    self.user_can_be_deleted = true

  end

  # this function maps the vars from your app into your engine
  def self.setup
    yield self
  end

  class Engine < ::Rails::Engine
    isolate_namespace AcaRails

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths["db/migrate"].concat config.paths["db/migrate"].expanded
      end
    end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end



  end
end
