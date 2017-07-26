require "rails/generators"
require "rails/generators/active_record"

module AcaRails
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    #argument :install_name, :type => :string, :default => "application"

    def create_initializer
      copy_file   "aca_rails.rb", "config/initializers/aca_rails.rb"
    end
    def config_routes
      route "mount AcaRails::Engine => '/aca_rails'"
    end
  end
end

