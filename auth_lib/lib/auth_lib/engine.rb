require 'rubygems'
require 'devise'
require 'cancan'
require 'omniauth'
require 'omniauth-oauth2'

module AuthLib
  class Engine < ::Rails::Engine
    isolate_namespace AuthLib
  end
end
