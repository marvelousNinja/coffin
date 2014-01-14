module RailsAdminProcess
  class Engine < ::Rails::Engine
    initializer 'rails_admin_process.reload_sections'do |app|
      RailsAdmin::Config::Model.send(:include, RailsAdmin::Config::Sections)
    end
  end
end
