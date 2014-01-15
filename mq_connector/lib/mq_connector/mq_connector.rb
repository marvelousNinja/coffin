module MqConnector
  module Basic
    extend ActiveSupport::Concern

    module ClassMethods
      def connect(&client_code)
        AMQP.start(
          client_code: client_code,
          auto_recovery: true,
          on_tcp_connection_failure: method(:handle_tcp_failure),
          on_tcp_connection_loss: method(:handle_tcp_connection_loss)) do |connection|
          connection.on_tcp_connection_loss &method(:handle_tcp_connection_loss)
          process(connection)
        end
      end

      def process(connection)
        AMQP::Channel.new(connection, auto_recovery: true) do |channel|
          connection.settings[:client_code].call(connection, channel)
        end
      end

      def disconnect
        AMQP.stop { EM.stop }
      end

      def handle_tcp_connection_loss(connection, settings)
        puts "[MqConnector] Lost connection. Retrying in 3 seconds..."
        sleep 3
        connection.reconnect(true, 1)
      end

      def handle_tcp_failure(settings)
        puts "[MqConnector] Can't connect to broker. Retrying in 3 seconds..."
        sleep 3
        process(AMQP.connect(settings))
      end
    end
  end

  module Handler
    extend ActiveSupport::Concern
    include Basic

    def self.included(base)
      @included_into ||= []
      @included_into << base
    end

    def self.included_into
      @included_into ||= []
    end

    module ClassMethods
      def handle(*)
        raise NotImplementedError
      end
    end
  end

  module Sender
    extend ActiveSupport::Concern
    include Basic

    module ClassMethods
      def send_message(*)
        raise NotImplementedError
      end
    end
  end
end