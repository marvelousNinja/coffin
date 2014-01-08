require 'thin'
require 'amqp'
require 'mq_connector/mq_connector'

module MqConnector
  class Engine < ::Rails::Engine
    isolate_namespace MqConnector

    initializer 'mq_connector.autoload', :before => :set_autoload_paths do |app|
      app.config.autoload_paths += %W(#{app.root}/app/messages/handlers #{app.root}/app/messages/senders)
    end

    initializer 'mq_connector.handle_cycle', :after => :load_config_initializers do |app|
    	app.eager_load!
      EventMachine.next_tick do
        MqConnector::Handler.included_into.each do |handler|
          handler.handle
        end
      end
    end
  end
end
