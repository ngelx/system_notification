module SystemNotification
  class Engine < ::Rails::Engine
    isolate_namespace SystemNotification

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    # config.to_prepare do
    #   # Make the implementing application's helpers available to the engine.
    #   # This is required for the overriding of engine views and helpers to work correctly.
    #   SystemNotification::ApplicationController.helper Rails.application.helpers
    # end


    # Included in the else from fix_migrations
    # initializer :append_migrations do |app|
    #  unless app.root.to_s.match root.to_s
    #    config.paths["db/migrate"].expanded.each do |expanded_path|
    #      app.config.paths["db/migrate"] << expanded_path
    #    end
    #  end
    # end

    initializer :fix_migrations do |app|
      if app.root.to_s.match root.to_s
        if Rails.env.development?
          task :set_annotation_options do
            Rake::Task["engine:set_annotation_options"].invoke
          end
        end
      else
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

  end
end
