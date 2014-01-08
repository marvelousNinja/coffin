require 'daemons-rails'
require 'bunny'

module MqConnector
  class Engine < ::Rails::Engine
    isolate_namespace MqConnector
  end
end
