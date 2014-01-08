require 'rails/generators/base'

module AuthLib
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

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

      def add_required_routes
        route "devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }\n  " <<
        "devise_scope :user do\n  " <<
        "  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session\n  " <<
        "  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session\n  " <<
        "end\n"
      end

      def copy_migrations
        rake 'auth_lib:install:migrations'
      end

      def copy_views
        copy_file 'new.html.erb', 'app/views/devise/sessions/new.html.erb'
      end
    end
  end
end
