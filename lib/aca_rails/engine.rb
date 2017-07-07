module AcaRails
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
