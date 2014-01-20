module MqConnector
  module Basic
    extend ActiveSupport::Concern

    module ClassMethods
      def connect(&block)
        method = we_are_in_thin? ? 'connect' : 'start'

        AMQP.public_send(method) do |connection|
          AMQP::Channel.new(connection) do |channel|
            channel.topic('messages', durable: true) do |exchange, declare_ok|
              yield connection, channel, exchange
            end
          end
        end
      end

      def we_are_in_thin?
        defined?(::Thin) && ObjectSpace.each_object(::Thin::Server).to_a.present?
      end
    end
  end

  module Sender
    extend ActiveSupport::Concern
    include Basic

    module ClassMethods
      def transmit(message_key, opts)
        root_key = opts.fetch(:to)
        key = "#{root_key}.#{message_key}"
        contents = opts.fetch(:with).to_json

        connect do |connection, channel, exchange|
          exchange.publish contents, routing_key: key, persistent: true do
            log(key, contents)
            AMQP.stop { EM.stop }
          end
        end
      end

      def log(key, contents)
        puts "[#{self}]: Sent #{key} with contents: #{contents}"
      end
    end
  end

  module Handler
    extend ActiveSupport::Concern
    include Basic

    module ClassMethods
      def listen_to(root_key, opts = {})
        @queue_name = opts.fetch(:as, root_key)
        @root_key = root_key
      end

      def on(message_key, &block)
        connect do |connection, channel, exchange|
          key = "#{@root_key}.#{message_key}"
          queue = channel.queue(@queue_name, durable: true).bind(exchange, routing_key: key)
          queue.subscribe do |metadata, payload|
            contents = JSON.load(payload)
            yield contents
            log(key, contents)
          end
        end
      end

      def log(key, contents)
        puts "[#{self}]: Received #{key} with contents: #{contents}"
      end
    end
  end
end