require 'rubygems'
require 'devise'
require 'cancan'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth/strategies/centralized_auth'

module AuthLib
  class Engine < ::Rails::Engine
    isolate_namespace AuthLib
  end
end
