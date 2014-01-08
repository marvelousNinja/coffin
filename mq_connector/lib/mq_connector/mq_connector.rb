module MqConnector
  module Basic
    extend ActiveSupport::Concern

    module ClassMethods
      def connection
        @connection ||= AMQP.connect
      end

      def create_channel(*args, &block)
        AMQP::Channel.new(@connection, *args, &block)
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