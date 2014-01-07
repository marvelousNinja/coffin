require 'rails/generators/base'

module AuthLib
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Runs devise generators and sets up omniauth'
      class_option :orm

      def copy_initializer
        template 'devise.rb', 'config/initializers/devise.rb'
      end

      def copy_locale
        copy_file 'devise.en.yml', 'config/locales/devise.en.yml'
      end

      def copy_model
        copy_file 'user.rb', 'app/models/user.rb'
      end

      def copy_migrations
        generate 'auth_lib:install:migrations'
      end
    end
  end
end
