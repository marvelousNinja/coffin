require 'devise'
require 'cancan'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth/strategies/centralized_auth'
require 'omniauth/error_handling'

module AuthLib
  class Engine < ::Rails::Engine
    isolate_namespace AuthLib

    initializer 'auth_lib.include_error_handling' do |app|
      ActiveSupport.on_load(:action_controller) do
        include OmniAuth::ErrorHandling
      end
    end
  end
end
