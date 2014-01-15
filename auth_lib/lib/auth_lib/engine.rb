require 'rubygems'
require 'devise'
require 'cancan'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth/strategies/centralized_auth'

module AuthLib
  class Engine < ::Rails::Engine
    isolate_namespace AuthLib

    initializer 'auth_lib.patch_application_controller', :after => :load_config_initializers do |app|
      app.eager_load!
      ApplicationController.class_eval do
        # def after_sign_out_path_for(resource_or_scope)
        #   'http://localhost:3000/users/sign_out'
        # end

        rescue_from OAuth2::Error do
          sign_out_and_redirect current_user
        end
      end
    end
  end
end
