class <%= file_name.camelize %>Handler
  include MqConnector::Handler

  def self.handle
    channel  = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    queue = channel.queue('<%= file_name %>', durable: true).bind(exchange, routing_key: '<%= file_name %>')

    queue.subscribe do |metadata, payload|
      puts "Received a message: #{payload}"
    end
  end
end


