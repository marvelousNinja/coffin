require 'devise'
require 'devise-russian'
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

    initializer 'auth_lib.load_static_assets' do |app|
      #app.middleware.insert_after(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
      #app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    end
  end
end
