class <%= file_name.camelize %>Sender
  include MqConnector::Sender

  def self.send_message(message)
    channel = create_channel auto_recovery: true
    exchange = channel.topic('events', durable: true)

    exchange.publish message, routing_key: '<%= file_name %>', persistent: true

    puts "Sent message: #{message}"
    channel.close
  end
end