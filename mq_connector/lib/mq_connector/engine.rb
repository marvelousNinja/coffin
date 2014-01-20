require 'amqp'
require 'mq_connector/mq_connector'

module MqConnector
  class Engine < ::Rails::Engine
    isolate_namespace MqConnector

    initializer 'mq_connector.autoload', :before => :set_autoload_paths do |app|
      app.config.autoload_once_paths += %W(#{app.root}/app/messages/handlers #{app.root}/app/messages/senders)
      app.config.eager_load_paths << "#{app.root}/app/messages/handlers"
    end

    initializer 'mq_connector.handle_cycle' do |app|
      EM.next_tick { app.eager_load! }
    end
  end
end
